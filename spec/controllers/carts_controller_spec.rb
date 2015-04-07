require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe "#index" do
    it "should return all products in cart" do
      get :index


    end
  end
  before :each do

    @new = Cart.new(name: "pepsi",quantity:1)
    @total=Cart.count


  end


  describe '#add_product' do
    #before { visit products_path }
    #before { click_link 'Add to cart' }

    it 'should add a new product to cart ' do
      #get :add_product, id: Cart.create(name: 'nike')


      #specify { response.should redirect_to(index_path) }

      #new_product=Cart.new(name: @name,quantity:1)
      expect { @new.save }.to change { Cart.count }.by(1)
      #get :add_product/ab
      #Cart.count.should==@total+1
      #expect(response).to render_template("index")
      expect(response.status).to eql(200)
      #current_path.should==index_path
      #response.should redirect_to :action => "index"

    end
  end

  describe '#destroy' do
    it 'should destroy product from the cart' do
      @new.save
      expect {@new.destroy}.to change { Cart.count }.by(-1)
    end
  end

end
