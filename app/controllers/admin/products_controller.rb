class Admin::ProductsController < ApplicationController

  layout 'admin'
  before_action :authenticate_user!

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice:'新增商品成功'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to admin_products_path, notice:'商品已刪除'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :is_online)
  end

end
