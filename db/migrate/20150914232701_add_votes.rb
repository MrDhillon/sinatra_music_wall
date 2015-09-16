class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :track
      t.references :user
      t.integer :vote_count
    end
  end
end
