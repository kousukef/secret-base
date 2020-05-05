class ProductCategoriesController < ApplicationController
  
  def category
    p = ProductCategory.find_by(name: params[:category_name])
    if @categories = p.children
      respond_to do |format|
        format.json {@categories}
      end
    end
  end
end
