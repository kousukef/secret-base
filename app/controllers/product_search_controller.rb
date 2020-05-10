class ProductSearchController < ApplicationController
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    render 'products/index'
  end
end
