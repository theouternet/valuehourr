class LocationSerializer < ActiveModel::Serializer
    attributes :id, :name, :share_list
    has_many :shares

end 

