class Address < ActiveRecord::Base
  belongs_to  :user
  has_many    :orders
  
  validates :city, :line1, :state, :user_id, :zip, presence: true
  validates :zip, length: { is: 5, message: 'Zip code must be five digits.' }
  validates :state, format: { with: /[A-Z]{2}/, message: 'State abbreviation must be two capitalized letters.'}
  
  def to_s
    "#{line1}, #{line2}, #{city}, #{state} #{zip}"
  end
end
