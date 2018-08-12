class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
         t.date :rent_start
         t.date :rent_end
         t.integer :renter_id
         t.timestamps
    end
  end
end
