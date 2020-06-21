class SpeaksController < ApplicationController
	before_action :authenticate_user!
  def speak
    #message type に合ったmessageをviewに渡す
    @product = Product.find(params[:id])
    if params[:message_type] == 'q_and_a'
      @messages = QAndAMessage.where(product_id: @product.id)
      @message_type = 'q_and_a'
    elsif params[:message_type] == 'after_purchased'
      if @product.purchaser_id.nil?
        @product.update!(purchaser_id: current_user.id)
        flash[:notice] = '購入しました'
      end
      @messages = AfterPurchasedMessage.where(product_id: @product.id)
      @message_type = 'after_purchased'
    end
  end
end
