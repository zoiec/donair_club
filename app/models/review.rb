class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  after_create_commit { ReviewBroadcastJob.perform_later self }
end
