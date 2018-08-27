class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  after_create_commit { ReviewBroadcastJob.perform_later self }

  def presentation(restaurant)
    binding.pry

    length = reviews_length(restaurant)
    restaurant.reviews.map{ |t| t.presentation }.any? ? restaurant.reviews.map{ |t| t.presentation }.sum / length : 0
  end

  private

  def reviews_length(restaurant)
    binding.pry
    restaurant.reviews.length
  end
end
