class ReviewBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActionCable.server.broadcast 'review_channel', render_review(args.first)
  end

  private

  def render_review(data)
    ApplicationController.renderer.render(partial: 'reviews/review', locals: { review: data })
  end
end
