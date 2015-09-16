class AddReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    t.references :track
    t.references :user
    t.string :review
    t.timestamps
    end
  end
end
