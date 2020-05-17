class CategoriesController < ApplicationController
  
  def category
    p = Category.find(params[:category_id])
    @categories = p.children
    respond_to do |format|
      format.json {@categories}
    end
  end
end
