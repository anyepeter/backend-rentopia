class User < ApplicationRecord
    has_many :houses
    has_one_attached :avatar
end
