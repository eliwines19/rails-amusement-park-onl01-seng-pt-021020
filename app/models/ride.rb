class Ride < ActiveRecord::Base
  belongs_to :Attraction
  has_many :users
end
