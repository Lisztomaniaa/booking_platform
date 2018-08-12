class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :feedback
      t.references :reviewable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
