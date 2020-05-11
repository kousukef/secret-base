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
    if product.user_id == current_user.id
      right_or_left = 'right'
      exhibitor = true
    else
      right_or_left = 'left'
      exhibitor = false
    end
    user = current_user
    user_image = user.user_image.message_thumb.url
    user_name = user.name
    Message.create!(content: data['message'], product_id: product.id, user_id: user.id, exhibitor: exhibitor)
    ProductChannel.broadcast_to product, {message: data['message'], right_or_left: right_or_left, user_image: user_image, user_name: user_name}
  end
  
  def product
    Product.find(params[:product_id])
  end
end
