class NearByPlace < ApplicationRecord
  belongs_to :place
  belongs_to :house
end
