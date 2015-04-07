class ProductsController < ApplicationController




	def index
		@product=Product.all
  end


	def show
		query = params[:id]

    @result=Product.search(query)
  end

  def new

    @result=Product.new
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def create
    @result=Product.new(post_params)
    if @result.save
      redirect_to products_path
    else
     # render 'new'
      #flash[:notice] = "invalid params" still don't know the meaning.
      render json: @result.errors
      #render json: @result.errors.messages same as above.

      #redirect_to new_product_path
    end
  end

  def search
    @result=Product.search(params[:q])
  end

    def post_params
      params.require(:product).permit(:type_of_product, :name, :company, :price)
    end	

end
