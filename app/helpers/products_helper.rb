module ProductsHelper
  def show_price(price)
    number_to_currency price
  end
  
  def print_stock(stock)
    if stock > 0
      "In Stock (#{stock})"
    else
      "Out of Stock"
    end
  end
end
