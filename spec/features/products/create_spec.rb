require 'spec_helper'
# rspec spec/features/products/create_spec.rb

describe "Creating products" do
  it "redirects to the products index page on success" do
    visit "/products"
    click_link "New Product"
    expect(page).to have_content("New product")
    
    fill_in "Title", with: "T-Shirt"
    fill_in "Price", with: 2.99
    fill_in "Description", with: "Summer Classic White T-shirt"
    fill_in "Image url", with: "TShirt.png"
    click_button "Create Product"
    
    expect(page).to have_content("T-Shirt")
  end
  
  it "displays an error when the product has no title" do
    expect(Product.count).to eq(0)
    
    visit "/products"
    click_link "New Product"
    expect(page).to have_content("New product")
    
    fill_in "Title", with: ""
    fill_in "Price", with: 2.99
    fill_in "Description", with: "Summer Classic White T-shirt"
    fill_in "Image url", with: "TShirt.png"
    click_button "Create Product"
    
    expect(page).to have_content("error")
    expect(Product.count).to eq(0)
    
    visit "/products"
    expect(page).to_not have_content("Summer Classic White T-shirt")
    
    
  end
end
