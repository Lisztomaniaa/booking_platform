class Item < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :bookings,dependent: :destroy
  has_many :reviews, as: :reviewable
  validates_presence_of :name, :owner

  scope :by_category, ->(category_ids) { where(category_id: category_ids)}
  scope :by_city, ->(city_ids) { where(city_id: city_ids)}

  scope :by_name, ->(name) { where(arel_table[:name].matches("%#{name}%"))}
  scope :booked, ->(rent_start,rent_end) do
    b = Booking.areal_table
    joins(:bookings).where(b[:rent_start].lteq(rent_end).and(b[:rent_end].qteq(rent_start)))
  end
  scope :available, ->(rent_start,rent_end) do
    where.not(id: booked(rent_start, rent_end))
  end
end
