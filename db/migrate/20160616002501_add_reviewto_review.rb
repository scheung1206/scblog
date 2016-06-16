class AddReviewtoReview < ActiveRecord::Migration
  def change
    add_column :reviews, :review, :review
  end
end
