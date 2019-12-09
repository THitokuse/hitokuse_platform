class ProductsController < ApplicationController
  before_action :login, only: [:new]
  def index
    @products = Product.order("created_at DESC").limit(10)
    @news = News.order("created_at DESC").limit(10)
  end

  def new

  end

  def create
    Product.create(product_params)
    redirect_to root_path
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user)
  end

  private
  def product_params
    params.permit(:title, :product_url, :text).merge(user_id: current_user.id)
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
