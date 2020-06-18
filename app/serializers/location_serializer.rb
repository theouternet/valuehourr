class LocationSerializer < ActiveModel::Serializer
    attributes :id, :name, :zip
    has_many :shares

end 

