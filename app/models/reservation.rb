class Reservation < ApplicationRecord
  validates :begin, presence:true
  validates :finish, presence:true
  validates :fee, presence:true
  validates :number_of_guests, presence:true, numericality:{only_integer: true, greater_than_or_equal_to: 1}

end
