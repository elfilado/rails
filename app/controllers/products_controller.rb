class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :authorize_seller!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @products = Product.all
    end
  
    def show
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = current_user.seller.products.build(product_params)
      if @product.save
        redirect_to products_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @product.update(product_params)
        redirect_to products_path, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      if @product.destroy
        redirect_to products_url, notice: 'Product was successfully destroyed.'
      else
        redirect_to products_url, alert: 'Product could not be destroyed. Please check for associated records or constraints.'
      end
    end
  
    private
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock)
    end
  
    def authorize_seller!
      redirect_to root_path, alert: 'Not authorized.' unless current_user.seller
    end
  end
  