class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
    @product_category = ProductCategory.new
    product_categories = ProductCategory.where(ancestry: nil).map { |c| c[:name]}
    @collections = product_categories.unshift('選択してください')
  end
  
  def create
    p = product_params
    product_p = {name: p[:name], description: p[:description], price: p[:price], product_image: p[:product_image]}
    @product = current_user.products.build(product_p)
    category = ProductCategory.find_by(name: p[:product_category][:ancestry])
    @product.product_category_id = category.id
    if @product.save
      redirect_to products_url, notice: '作成に成功'
    else
      flash[:error] = '作成に失敗'
      render :new
    end
  end
  
  def myproducts
    @products = current_user.products
    if @products.any?
      render :index
    else
      flash[:alert] = 'MyProductsがありません'
      redirect_to root_path
    end
  end
  
  private
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :product_image,product_category: [:ancestry])
    end
end
