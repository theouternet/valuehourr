class Location < ActiveRecord::Base
  has_many :shares

  validates :name, presence: true


end
