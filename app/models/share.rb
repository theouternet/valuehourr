class Share < ActiveRecord::Base

 belongs_to :user
 belongs_to :location


 scope :created_after, ->(time) { where("created_at >= ?", time) }



end
