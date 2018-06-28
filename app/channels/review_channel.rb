class ReviewChannel < ApplicationCable::Channel
  def subscribed
    stream_from "review_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def submit(data)
    ActionCable.server.broadcast 'review_channel', review: data
  end
end
