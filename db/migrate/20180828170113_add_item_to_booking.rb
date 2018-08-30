class AddItemToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :item, foreign_key: true
  end
end
