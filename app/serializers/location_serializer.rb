class LocationSerializer < ActiveModel::Serializer
    attributes :id, :name, :share_list
    has_many :shares

def share_list 
    object.shares.map do |share|
        {
            id: share.user_id,
            username: User.find(share.user_id).username
        },
        price: share.price 
    } 
end 
end 
end 

