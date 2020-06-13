class LocationSerializer < ActiveModel::Serializer
    attributes :id, :name, :share_list
    has_many :shares
    has_one :user


def share_list 
    object.shares.map do |share|
        {
            id: share.id,
            user: {
            username: User.find(share.user_id).username
        },
        price: share.price 
    } 
end 
end 
end 

