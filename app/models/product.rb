class Product < ActiveRecord::Base
  has_many :order_items
  
  validates :title, presence: true
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :description, presence: true, length: { minimum: 10, too_short: "must have at least %{count} characters"}
  validates :price, presence: true
  validates :image_url, presence: true
  validates :category, presence: true
  
  
  def price=(input)
    input.delete!("$")
    super
  end
end
