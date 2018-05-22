class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.decimal :value
      t.decimal :presentation
      t.decimal :texture
      t.integer :napkins_used
      t.decimal :taste
      t.decimal :gut_feel_under_30
      t.decimal :gut_feel_after_30
      t.decimal :order_accuracy
      t.decimal :sauce_level
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
