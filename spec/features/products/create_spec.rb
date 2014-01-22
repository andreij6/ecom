require 'spec_helper'
# rspec spec/features/products/create_spec.rb

describe "Creating products" do
  
  def create_product(options={})
    options[:title] ||= "T-Shirt"
    options[:price] ||= "T-Shirt"
    options[:description] ||= "T-Shirt"
    options[:image_url] ||= "T-Shirt"
    
    visit "/products"
    click_link "New Product"
    expect(page).to have_content("New product")
    
    fill_in "Title", with: options[:title]
    fill_in "Price", with: options[:price]
    fill_in "Description", with: options[:description]
    fill_in "Image url", with: options[:image_url]
    click_button "Create Product"
  end
  
  it "redirects to the products index page on success" do
    create_product
    
    expect(page).to have_content("T-Shirt")
  end
  
  it "displays an error when the product has no title" do
    expect(Product.count).to eq(0)
    
    create_product title: ""
    
    expect(page).to have_content("error")
    expect(Product.count).to eq(0)
    
    visit "/products"
    expect(page).to_not have_content("Summer Classic White T-shirt")
    
    
  end
end
