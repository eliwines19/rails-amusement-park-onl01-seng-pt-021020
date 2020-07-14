class Ride < ActiveRecord::Base
  belongs_to :Attraction
  belongs_to :user

  
end
