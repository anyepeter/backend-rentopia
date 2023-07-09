class House < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :security
  belongs_to :location
  has_many :near_by_places,
  has_many :places, through: :near_by_places
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :security
end
