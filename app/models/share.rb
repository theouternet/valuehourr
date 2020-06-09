class Share < ActiveRecord::Base

 belongs_to :user
 belongs_to :drink
 belongs_to :location

 validates :drink, :location, presence: true

 scope :created_after, ->(time) { where("created_at >= ?", time) }



 def location_name=(name)
    self.location = Location.find_or_create_by(name: name)
 end 
 
 def location_name 
    self.location ? self.location.name : nil
 end 

 def drink_name=(name)
    self.drink = Drink.find_or_create_by(name: name)
 end 
 
 def drink_name 
    self.drink ? self.drink.name : nil
 end 

end
