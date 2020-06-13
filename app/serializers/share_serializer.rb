class ShareSerializer < ActiveModel::Serializer
    attributes :id, :price, :size
    belongs_to :location
    belongs_to :user


    
end 
