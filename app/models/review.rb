class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :author, class_name: 'User'
end
