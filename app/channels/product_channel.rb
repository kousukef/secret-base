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
      user = 'right'
      exhibitor = true
    else
      user = 'left'
      exhibitor = false
    end
    Message.create!(content: data['message'], product_id: product.id, user_id: current_user.id, exhibitor: exhibitor)
    ProductChannel.broadcast_to product, {message: data['message'], user: user}
  end
  
  def product
    Product.find(params[:product_id])
  end
end
