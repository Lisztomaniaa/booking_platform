class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items, dependent: :destroy
  belongs_to :city
  has_many :reviews, as: :reviewable
  has_many :authored_reviews, class_name: 'Review', foreign_key: :author_id,
                                                  dependent: :nullify


end
