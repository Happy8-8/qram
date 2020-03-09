class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :dealer
  belongs_to :consumer
  belongs_to :car
end
