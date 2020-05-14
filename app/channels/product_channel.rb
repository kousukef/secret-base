class ProductChannel < ApplicationCable::Channel
  def subscribed
    stream_for product
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    product = Product.find(params[:product_id])
    
    #productの出品者かどうかを識別する
    if product.seller_id == current_user.id
      right_or_left = 'right'
      exhibitor = true
    else
      right_or_left = 'left'
      exhibitor = false
    end
    
    
    user = current_user
    avatar = user.avatar.message_thumb.url
    user_name = user.name
    
    #Q&A messageか、購入後のmessageかを見分ける
    if data['message_type'] == 'q_and_a'
      QAndAMessage.create!(content: data['message'], product_id: product.id, user_id: user.id, exhibitor: exhibitor)
    elsif data['message_type'] == 'after_purchased'
      AfterPurchasedMessage.create!(content: data['message'], product_id: product.id, user_id: user.id, exhibitor: exhibitor)
    end
    ProductChannel.broadcast_to product, {message: data['message'], right_or_left: right_or_left,
                                          avatar: avatar, user_name: user_name, message_type: data['message_type']}
  end
  
  def product
    Product.find(params[:product_id])
  end
end
