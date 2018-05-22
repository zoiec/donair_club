json.extract! review, :id, :value, :presentation, :texture, :napkins_used, :taste, :gut_feel_under_30, :gut_feel_after_30, :order_accuracy, :sauce_level, :notes, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)
