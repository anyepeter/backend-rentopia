class House < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :security
  belongs_to :location
end
