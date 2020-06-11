class ShareSerializer < ActiveModel::Serializer
    attributes :id, :price
    belongs_to :location


    
end 
