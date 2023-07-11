class Place < ApplicationRecord
    has_many :near_by_places
    has_many :houses, through: :near_by_places
end
