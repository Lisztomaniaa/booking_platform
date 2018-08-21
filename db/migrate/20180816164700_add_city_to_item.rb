class AddCityToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :city, foreign_key: true
  end
end
