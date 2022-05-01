class Flat < ApplicationRecord
  # Only change values below
  price_per_night_min = 10
  number_of_guests_min = 1

  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
  validates :price_per_night, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: price_per_night_min, 
    message: "should be a price greather than #{price_per_night_min}€" 
  }
  validates :number_of_guests, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: number_of_guests_min, 
    message: "should be greather than #{number_of_guests_min}" 
  }
end
