
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :create, :edit, :update]

  def index
    if params[:search]
      @products = Product.where(
        'name ~* ?',
        params[:search]
      )
      # @products = Product.where(name: params[:search])
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # if @product.save
    #   redirect_to products_path
    # else
    #   render :new
    # end

    return redirect_to products_path if @product.save
    render :new
  end

  def show
  end

  def edit
  end

  def update
    # if @product.update(product_params)
    #   redirect_to products_path
    # else
    #   render :edit
    # end
    return redirect_to products_path if @product.update(product_params)
    render :edit
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :price, :category_id
    )
  end
end
