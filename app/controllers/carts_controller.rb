require 'rest_client'
class CartsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def add




  end

  def index

    @result=Cart.all
  end

  def add_product
    #binding.pry
    #byebug
    #response=RestClient.get 'https://www.facebook.com'
    #response=RestClient.get 'https://protected-basin-4048.herokuapp.com/'
    #render json: response and return  they will send xml code or page but don't know how to get actual page.
    @name=params[:name]
    @record = Cart.search(params[:name]).first




    #flash[:error] = "plajsadke" don't know what it do. i think they are added in the session


   # @abc=Cart.find_by(:name => @name)



    if !@record.nil?
      Cart.new(name: @name,quantity: @record.quantity += 1).save
      Cart.destroy(Cart.search(params[:name]).first)
      #flash.now[:alert] = "Wrong password."
      flash[:success] = "Product's quantity is increamented in the cart" # not clear.
    else
      Cart.new(name: @name,quantity:1).save
    end
    #render xml: @record this convert @record object into xml and show it
    #render json: @record this convert @record object into json and show it
    redirect_to :action => "index"
    #render @result generating errors.
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
