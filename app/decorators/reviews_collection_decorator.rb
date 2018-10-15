class ReviewsCollectionDecorator < Draper::CollectionDecorator

  def reviews_totals
    {
      gut_feel_under_30: object.map{ |r| r.gut_feel_under_30 }.sum.to_f / length || 0,
      gut_feel_after_30: object.map{ |r| r.gut_feel_after_30 }.sum.to_f / length || 0,
      napkins_used: object.map{ |r| r.napkins_used }.sum.to_f / length || 0,
      order_accuracy: object.map{ |r| r.order_accuracy }.sum.to_f / length || 0,
      presentation: object.map{ |r| r.presentation }.sum.to_f / length || 0,
      sauce_level: object.map{ |r| r.sauce_level }.sum.to_f / length || 0,
      taste: object.map{ |r| r.taste }.sum.to_f / length || 0,
      texture: object.map{ |r| r.texture }.sum.to_f / length || 0,
      value: object.map{ |r| r.value }.sum.to_f / length || 0
    }
  end

  private

  def length
    object.size
  end
end
