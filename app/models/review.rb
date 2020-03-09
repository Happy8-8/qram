class Review < ApplicationRecord
  belongs_to :consumer
  belongs_to :car
  after_create :send_review_email

  RATINGS = {
    'one star': '1_star',
    'two stars': '2_stars',
    'three stars': '3_stars',
    'four stars': '4_stars',
    'five stars': '5_stars'
  }
  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_review_email
    NotificationMailer.review_added(self).deliver_now
end
end
