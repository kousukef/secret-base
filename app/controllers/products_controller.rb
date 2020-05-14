class ProductsController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :product_params, only: [:create, :update]
  before_action :authenticate_user!, except: [:index, :search]
  
  def index
    if params[:category].nil?
      @products = Product.all
    else
      category = ProductCategory.find_by(category_params)
      @products = Product.where(product_category_id: category.subtree_ids)
      
      #左上のリンクに使う
      @product_path = category.path.map {|c| c.name}
      @product_children = category.children.map {|c| c.name}
    end
    #検索フォーム
    @q = Product.ransack(params[:q])
  end
  
  def show
    if @product = Product.find_by(id: params[:id])
      show_images
    else
      redirect_to products_url
    end
  end
  
  def new
    @product = Product.new
    product_categories
  end
  
  
  def create
    @product = current_user.sales_products.build(@product_params)
    if @product.save
      redirect_to products_path, notice: '作成に成功'
    else
      flash[:alert] = '作成に失敗'
      product_categories
      redirect_to new_product_url
    end
  end
  
  def edit
    @product = Product.find(params[:id])
    product_categories
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(@product_params)
      flash[:success] = "編集に成功しました"
      redirect_to @product
    else
      flash.now[:alert] = '編集に失敗しました'
      product_categories
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    flash[:success] = '削除しました'
    @user = current_user
    
    #userの商品がもうないなら
    if @user.sales_products.empty?
      render user_info_path
      
    #userの商品がまだあれば
    else
      @products = @user.sales_products
      @exhibitor = true
      render :index
    end
  end
  
 
  #質問ルーム
  def speak
    #message type に合ったmessageをviewに渡す
    @product = Product.find(params[:id])
    if params[:message_type] == 'q_and_a'
      @messages = QAndAMessage.where(product_id: @product.id)
      @message_type = 'q_and_a'
    elsif params[:message_type] == 'after_purchased'
      @product.update!(purchaser_id: current_user.id) if @product.purchaser_id.niL?
      @messages = AfterPurchasedMessage.where(product_id: @product.id)
      @message_type = 'after_purchased'
    end
  end
   #出品商品一覧
  def sales_products
    @products = current_user.sales_products
    if @products.any?
      @title = '出品商品'
      render :index
    else
      flash[:alert] = '出品商品がありません'
      redirect_to user_info_url
    end
  end
  
  #購入商品一覧
  def purchased_products
    @products = current_user.purchased_products
    if @products.any?
      @title = '購入商品'
      render :index
    else
      flash[:alert] = '購入商品がありません'
      redirect_to user_info_url
    end
  end
  
  def search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    render :index
  end
  
  
  private
  
    #そのまま渡せないので分解
    def product_params
      p = params.require(:product).permit(:name, :description, :price, {product_image: []},product_category: [:ancestry])
      if p[:product_category][:ancestry] != '選択してください'
        product_category_id = ProductCategory.find_by(name: p[:product_category][:ancestry]).id 
        @product_params = {name: p[:name], description: p[:description], price: p[:price],
                          product_image: p[:product_image], product_category_id: product_category_id }
      end
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
    
    def correct_user
      @product = current_user.sales_products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end
    
    def show_images
      @product_images = @product.product_image.map {|i| i.show_image.url}
    end
    
    def product_categories
      @product_category = ProductCategory.new
      product_categories = ProductCategory.where(ancestry: nil).map { |c| c[:name]}
      @collections = product_categories.unshift('選択してください')
    end
end
