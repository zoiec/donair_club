class ApplicationController < ActionController::Base
  expose(:restaurants_decorator) { RestaurantCollectionDecorator.new(Restaurant.all.decorate) }
  expose(:reviews_decorator) { ReviewsCollectionDecorator.new(Review.all.decorate) }
end
