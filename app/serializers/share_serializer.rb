class ShareSerializer < ActiveModel::Serializer
    attributes :id, :price, :size, :location_id
    belongs_to :location
    belongs_to :user


    
end 
