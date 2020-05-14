class ProductCategoriesController < ApplicationController
  
  def category
    p = ProductCategory.find(params[:category_id])
    @categories = p.children
    respond_to do |format|
      format.json {@categories}
    end
  end
end
