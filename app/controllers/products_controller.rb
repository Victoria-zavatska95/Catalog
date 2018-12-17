class ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_product, only: [:show]

	def new
    @product = Product.new
  end
  
  def create
    @product = current_user.products.build(product_params)
    if @product.save
    	flash[:notice] = "You successfully created product"
      redirect_to product_path(@product.id)
    else
    	flash[:error] = "You failed to create product"
      render 'new'
    end
    
  end
  
  def find_product
  	@product = Product.find_by(id: params[:id])
  end	

  def product_params
  	params.require(:product).permit(:title, :description, :price)
  end	
end
