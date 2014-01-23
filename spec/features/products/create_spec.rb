require 'spec_helper'
# rspec spec/features/products/create_spec.rb

describe "Creating products" do
  
  def create_product(options={})
    options[:title] ||= "T-Shirt"
    options[:price] ||= 2.99
    options[:description] ||= "This is a description"
    options[:image_url] ||= "TShirt.png"
    options[:category] ||= "Shirt"
    options[:stock] ||= 3
    
    visit "/products"
    click_link "New Product"
    expect(page).to have_content("New product")
    
    fill_in "Title", with: options[:title]
    fill_in "Price", with: options[:price]
    fill_in "Description", with: options[:description]
    fill_in "Image url", with: options[:image_url]
    fill_in "Stock", with: options[:stock]
    fill_in "Category", with: options[:category]
    
    click_button "Create Product"
  end
  
#Success  
  it "redirects to the products index page on success" do
    create_product
    
    expect(page).to have_content("T-Shirt")
  end
  
#Title
  it "displays an error when the product has no title" do
    expect(Product.count).to eq(0)
    
    create_product title: ""
    
    expect(page).to have_content("error")
    expect(Product.count).to eq(0)
    
    visit "/products"
    expect(page).to_not have_content("Summer Classic White T-shirt")
  end

#Stock
  it "displays an error when stock is not a number" do 
      create_product stock: "text"
      
      expect(page).to have_content("error")
      expect(Product.count).to eq(0)
      
      visit "/products"
      expect(page).to_not have_content("Summer Classic White T-shirt")
    end
    
  it "should error when stock is not greater than zero" do
      create_product stock: 2.3
      
      expect(page).to have_content("error")
      expect(Product.count).to eq(0)
      
      visit "/products"
      expect(page).to_not have_content("Summer Classic White T-shirt")
    end
    
#Description
  it "should error when no description is given" do
      create_product description: ""
      
      expect(page).to have_content("error")
      expect(Product.count).to eq(0)
      
      visit "/products"
      expect(page).to_not have_content("Summer Classic White T-shirt")
    end
    
  it "should error when the description is less than 10 characters" do
      create_product description: "not ten"
      
      expect(page).to have_content("error")
      expect(Product.count).to eq(0)
      
      visit "/products"
      expect(page).to_not have_content("Summer Classic White T-shirt")
    end
    
# Price
  it "should error when price is not present" do
      create_product price: ""
      
      expect(page).to have_content("error")
      expect(Product.count).to eq(0)
      
      visit "/products"
      expect(page).to_not have_content("Summer Classic White T-shirt")
    end
    
#Image_Url
  it "should error when image_url is not present" do
      create_product image_url: ""
      
      expect(page).to have_content("error")
      expect(Product.count).to eq(0)
      
      visit "/products"
      expect(page).to_not have_content("Summer Classic White T-shirt")
    end
    
#Category
  it "should error when category is not present" do
      create_product category: ""
      
      expect(page).to have_content("error")
      expect(Product.count).to eq(0)
      
      visit "/products"
      expect(page).to_not have_content("Summer Classic White T-shirt")
    end

end





























