class ProductChannel < ApplicationCable::Channel
  def subscribed
    stream_for product
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message, message_type)
    product = Product.find(params[:product_id])
    binding.pry
    #productの出品者かどうかを識別する
    if product.seller_id == current_user.id
      right_or_left = 'right'
      exhibitor = true
    else
      right_or_left = 'left'
      exhibitor = false
    end
    
    
    user = current_user
    user_image = user.user_image.message_thumb.url
    user_name = user.name
    
    #Q&A messageか、購入後のmessageかを見分ける
    if message_type == 'q_and_a'
      Message.create!(content: message['message'], product_id: product.id, user_id: user.id, exhibitor: exhibitor)
    elsif message_type == 'after_purchased'
      Message.create!(content: message['message'], product_id: product.id, user_id: user.id, exhibitor: exhibitor)
    end
    ProductChannel.broadcast_to product, {message: message['message'], right_or_left: right_or_left,
                                          user_image: user_image, user_name: user_name, message_type: message_type}
  end
  
  def product
    Product.find(params[:product_id])
  end
end
