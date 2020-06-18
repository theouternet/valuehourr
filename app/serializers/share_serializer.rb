class ShareSerializer < ActiveModel::Serializer
    attributes :id, :price, :size, :location_id, :drink_name
    belongs_to :location
    belongs_to :user


    
end 
