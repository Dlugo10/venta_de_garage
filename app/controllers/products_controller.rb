class ProductsController < ApplicationController

  def index
    @products = Product.all

    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @products = Product.paginate(page: params[:page], per_page: 12).where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.all.paginate(page: params[:page], per_page: 12)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product = Product.update(product_params)
    redirect_to product_path(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end


  private 

  def product_params
    params.require(:product).permit(:price, :title, :age, :dimensions, :description, photos: [])
  end
end
