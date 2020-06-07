class ProductsController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :authenticate_user!, except: [:index, :search]
  before_action :categories, only: [:new, :create, :edit, :update]
  
  def index
    if params[:category].nil?
      @products = Product.all.page(params[:page]).per(20).order(created_at: :desc)
    else
      category = Category.find_by(category_params)
      @products = Product.where(category_id: category.subtree_ids).page(params[:page]).per(20).order(created_at: :desc)
      
      #左上のリンクに使う
      @product_path = category.path.map {|c| c.name}
      @product_children = category.children.map {|c| c.name}
    end
    #検索フォーム
    @q = Product.ransack(params[:q])
  end
  
  def show
    @product = Product.find_by(id: params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  
  def create
    @product = current_user.sales_products.build(product_params)
    if @product.save
      redirect_to products_path, notice: '作成に成功'
    else
      render :new 
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "編集に成功しました"
      redirect_to @product
    else
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = '削除しました'
    @products = Product.all.page(params[:page]).per(20).order(created_at: :desc)
    redirect_to products_url
  end
  
 
  #質問ルーム
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
   #出品商品一覧
  def sales_products
    @products = current_user.sales_products.page(params[:page]).per(20).order(created_at: :desc)
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
    @products = current_user.purchased_products.page(params[:page]).per(20).order(created_at: :desc)
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
    @products = @q.result(distinct: true).page(params[:page]).per(20).order(created_at: :desc)
    render :index
  end
  
  
  private
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, {images: []})
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
    
    def correct_user
      @product = Product.find_by(id: params[:id])
      redirect_to root_url unless @product.seller_id == current_user.id || current_user.admin
    end
    
    
    def categories
      @category = Category.new
      @categories = Category.where(ancestry: nil)
    end
    
end
