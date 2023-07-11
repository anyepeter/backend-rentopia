class User < ApplicationRecord
    has_many :houses
    has_one_attached :avatar

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :occupation, presence: true
    validates :phone_number, presence: true
    validates :avatar, attached: true, content_type: { in: %w[image/jpeg image/png], message: "must be a JPEG or PNG" },
                       size: { less_than: 5.megabytes, message: "should be less than 5MB" }
end
