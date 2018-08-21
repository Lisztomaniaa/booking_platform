class AddAuthorToReviews < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :reviews, :author
  end
end
