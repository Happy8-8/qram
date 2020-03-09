class Car < ApplicationRecord
  belongs_to :dealer
    has_many :descriptions
    has_many :reviews
    has_many :photos
    geocoded_by :address
    after_validation :geocode

    validates :name, presence: true, length: { minimum: 7, too_short: "is too short (minimum %{count} characters)" }
    validates :address, presence: true, length: { in: 11..159 }
    validates :ddescription, review, presence: true, length: { maximum: 371, too_long: "%{count} characters is the maximum allowed" } 
end
