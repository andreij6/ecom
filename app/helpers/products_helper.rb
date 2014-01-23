module ProductsHelper
  def show_price(price)
    number_to_currency price
  end
  
  def print_stock(stock, requested = 1)
    if stock < requested 
      content_tag(:span, "Insufficient stock (#{stock})", class: "low_stock")
    elsif stock > 0
      "In Stock (#{stock})"
    else
      "Out of Stock"
    end
  end
end
