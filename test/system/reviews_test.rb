require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h1", text: "Reviews"
  end

  test "creating a Review" do
    visit reviews_url
    click_on "New Review"

    fill_in "Gut Feel After 30", with: @review.gut_feel_after_30
    fill_in "Gut Feel Under 30", with: @review.gut_feel_under_30
    fill_in "Napkins Used", with: @review.napkins_used
    fill_in "Notes", with: @review.notes
    fill_in "Order Accuracy", with: @review.order_accuracy
    fill_in "Presentation", with: @review.presentation
    fill_in "Sauce Level", with: @review.sauce_level
    fill_in "Taste", with: @review.taste
    fill_in "Texture", with: @review.texture
    fill_in "User", with: @review.user_id
    fill_in "Value", with: @review.value
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit reviews_url
    click_on "Edit", match: :first

    fill_in "Gut Feel After 30", with: @review.gut_feel_after_30
    fill_in "Gut Feel Under 30", with: @review.gut_feel_under_30
    fill_in "Napkins Used", with: @review.napkins_used
    fill_in "Notes", with: @review.notes
    fill_in "Order Accuracy", with: @review.order_accuracy
    fill_in "Presentation", with: @review.presentation
    fill_in "Sauce Level", with: @review.sauce_level
    fill_in "Taste", with: @review.taste
    fill_in "Texture", with: @review.texture
    fill_in "User", with: @review.user_id
    fill_in "Value", with: @review.value
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
