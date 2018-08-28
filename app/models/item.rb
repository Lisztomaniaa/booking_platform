class Item < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :bookings,dependent: :destroy
  has_many :reviews, as: :reviewable
  validates_presence_of :name, :owner

  scope :by_category, ->(category_ids) { where(category_id: category_ids)}
  scope :by_city, ->(city_ids) { where(city_id: city_ids)}

  scope :by_name, ->(name) { where(arel_table[:name].matches("%#{name}%"))}
  def end_date_after_start_date?
   if date_to < date_from
     errors.add(:date_to, "End date must be after the start date")
    end
  end
end
