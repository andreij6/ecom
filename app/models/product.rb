class Product < ActiveRecord::Base
  validates :title, presence: true
  
  def price=(input)
    input.delete!("$")
    super
  end
end
