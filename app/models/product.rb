class Product < ActiveRecord::Base
  has_many :order_items
  
  validates :title, presence: true
  
  def price=(input)
    input.delete!("$")
    super
  end
end
