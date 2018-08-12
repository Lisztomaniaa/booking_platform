class Item < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :bookings
  has_many :reviews, as: :reviewable
end
