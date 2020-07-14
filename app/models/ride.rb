class Ride < ActiveRecord::Base
  belongs_to :Attraction
  belongs_to :user

  def take_ride
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride #{attraction.name}"
    elsif attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}"
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride #{attraction.name}"
    else
      user.update(tickets: user.tickets -= attraction.tickets, nausea: user.nausea += attraction.nausea_rating, happiness: user.happiness += attraction.happiness_rating)
      "Thanks for ride #{attraction.name}"
    end
  end
end
