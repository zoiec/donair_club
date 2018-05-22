require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_review_url
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post reviews_url, params: { review: { gut_feel_after_30: @review.gut_feel_after_30, gut_feel_under_30: @review.gut_feel_under_30, napkins_used: @review.napkins_used, notes: @review.notes, order_accuracy: @review.order_accuracy, presentation: @review.presentation, sauce_level: @review.sauce_level, taste: @review.taste, texture: @review.texture, user_id: @review.user_id, value: @review.value } }
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get review_url(@review)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_url(@review)
    assert_response :success
  end

  test "should update review" do
    patch review_url(@review), params: { review: { gut_feel_after_30: @review.gut_feel_after_30, gut_feel_under_30: @review.gut_feel_under_30, napkins_used: @review.napkins_used, notes: @review.notes, order_accuracy: @review.order_accuracy, presentation: @review.presentation, sauce_level: @review.sauce_level, taste: @review.taste, texture: @review.texture, user_id: @review.user_id, value: @review.value } }
    assert_redirected_to review_url(@review)
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete review_url(@review)
    end

    assert_redirected_to reviews_url
  end
end
