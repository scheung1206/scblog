class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :showname
      t.string :image
      t.integer :rating
      t.integer :year
      t.integer :number_ep

      t.timestamps null: false
    end
  end
end
