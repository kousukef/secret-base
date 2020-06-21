class SearchController < ApplicationController
  def search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).recent
    render 'products/index'
  end
end
