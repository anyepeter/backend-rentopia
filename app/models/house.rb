class House < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :category
  belongs_to :security
  belongs_to :location
  has_many :near_by_places
  has_many :places, through: :near_by_places
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :security
  accepts_nested_attributes_for :near_by_places

  has_one_attached :video
  has_many_attached :images

  #validations
  validates :title, presence: true
  validates :number_of_houses, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :metal_type, presence: true
  validates :water_source, presence: true
  validates :category_id, presence: true
  validates_associated :location, :security, :near_by_places


  # validates :video, attached: true, content_type: { in: ['video/mp4'], message: 'must be in MP4 format' }, size: { less_than: 100.megabytes, message: 'should be less than 100MB' }
  validates :images, attached: true, content_type: { in: ['image/jpeg', 'image/png'], message: 'must be in JPEG or PNG format' }
end
