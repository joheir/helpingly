class Offer < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_one_attached :photo
  validates :title, :description, :date, :hourly_rate, :location, :photo, presence: true
end
