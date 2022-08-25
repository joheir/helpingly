class Offer < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_one_attached :photo

  validates :title, :description, :hourly_rate, :location, :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
