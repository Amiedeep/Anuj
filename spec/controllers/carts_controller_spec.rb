require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe "#index" do
    it "should return all products in cart" do

    end
  end
  before :each do

    @total=Cart.count


  end


  describe '#add_product' do
    #before { visit products_path }
    #before { click_link 'Add to cart' }

    it 'should add a new product to cart ' do
      #get :add_product, id: Cart.create(name: 'nike')


      #specify { response.should redirect_to(index_path) }

      @ab=Cart.new(name: @name,quantity:1).save
      #get :add_product/ab
      Cart.count.should==@total+1
      expect(response).to redirect_to :action => "index"
      #current_path.should==index_path
      #response.should redirect_to :action => "index"

    end
  end
end
