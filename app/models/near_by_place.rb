class NearByPlace < ApplicationRecord
  belongs_to :place
  belongs_to :house
  accepts_nested_attributes_for :place
end
