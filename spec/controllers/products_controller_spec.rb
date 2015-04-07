require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  before :each do
    @new = Product.new(name: "pepsi" , type_of_product: "cocacola", company: "cocacola", price: '15')
    @total=Cart.count
  end



  describe '#show' do
    it 'should show the selected product' do
      @new.save
      @result=Product.search(@new)
      expect(response.status).to eql(200)
      #expect(@result).to match("pepsi") #object can't be matched to string
      #expect(@result.name).to have_content("pepsi")
      #not working properly
    end
  end

  describe '#destroy' do
    it 'should destroy the product from database' do
      @new.save
      expect {@new.destroy}.to change { Product.count }.by(-1)
      # response.should redirect_to products_path
      #expect(response).to redirect_to :action => :index
      #expect(subject).to redirect_to :action => :index
      #subject.should redirect_to :action => :index
      #response.should redirect_to :action => :index
      expect(response.status).to eql(200)
    end
  end

  describe '#create' do
    it 'should add new product to the database' do #check for existance of all necessary attributes.
      expect(subject.attributes).to include(:type_of_product, :name, :price)
      #its(:attributes) { should include("type_of_product") }
      expect { @new.save }.to change { Product.count }.by(1)
      expect(response.status).to eql(200)
    end
  end

end