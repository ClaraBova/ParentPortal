class Group < ActiveRecord::Base
  belongs_to :location
  validates :name, presence: true
  validates :description, length: { maximum: 500 }
  validates :location, presence: true
end
