class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user
  belongs_to :addresses
  
  def total
    subtotals = []
    order_items.each do |item|
      subtotals << item.subtotal
    end
    subtotals.inject{|sum, x| sum + x}
  end
end
