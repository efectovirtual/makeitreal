class ProductsController < ApplicationController
  def create
    secure = params.require(:product).permit(:sku, :name)

    product = secure[:product]
    @product = Product.new product
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.in_inventory
  end
end
