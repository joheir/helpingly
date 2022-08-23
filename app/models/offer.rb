class Offer < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :title, :description, :date, :hourly_rate, :location, presence: true
end
