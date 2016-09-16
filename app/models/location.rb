class Location < ActiveRecord::Base
  has_many :users
  has_many :groups

  validates :city, presence: true
  validates :state, presence: true, length: { maximum: 2 }
end
