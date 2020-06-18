class ShareSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :location_id, :drink_name, :drink_type, :drink_sub_type, :size, :price, :when_available, :menu_link
    belongs_to :location
    belongs_to :user


    
end 
