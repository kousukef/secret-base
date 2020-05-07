class ProductsController < ApplicationController
  
  
  def index
    if category_params[:name] == 'all'
      @products = Product.all
    else
      category = ProductCategory.find_by(category_params)
      @products = Product.where(product_category_id: category.subtree_ids)
      #左上のリンクに使う
      @product_path = category.path.map {|c| c.name}
      @product_children = category.children.map {|c| c.name}
    end
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
      redirect_to products_path(category: {name: 'all'}), notice: '作成に成功'
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
  
  def speak
    @product = Product.find(params[:id])
    @messages = Message.where(product_id: @product.id)
  end
  
  private
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :product_image,product_category: [:ancestry])
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
end
