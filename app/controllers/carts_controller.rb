class CartsController < ApplicationController


  def add




  end

  def index

    @result=Cart.all
  end

  def add_product
    #binding.pry
    @name=params[:name]
    @record = Cart.search(params[:name]).first





   # @abc=Cart.find_by(:name => @name)



    if !@record.nil?
      Cart.new(name: @name,quantity: @record.quantity += 1).save
      Cart.destroy(Cart.search(params[:name]).first)
    else
      Cart.new(name: @name,quantity:1).save
    end

    redirect_to :action => "index"
  end

  def destroy

    Cart.destroy(params[:id])
    redirect_to :action => "index"
  end

  def post_params
    params.require(:products).permit(:type_of_product, :name, :company, :price)
    params.require(:carts).permit(:name, :quantity)
  end

end
