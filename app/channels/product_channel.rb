class ProductChannel < ApplicationCable::Channel
  def subscribed
    stream_for product
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    product = Product.find(params[:product_id])
    Message.create!(content: data[:message], product_id: product.id, user_id: current_user.id)
    ProductChannel.broadcast_to product, message: data['message']
  end
  
  def product
    Product.find(params[:product_id])
  end
end
