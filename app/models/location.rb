class Location < ActiveRecord::Base
  has_many :users
  has_many :groups

  validates :city, presence: true
  validates :state, presence: true, length: { maximum: 2 }

  def local_groups
    Group.where(location_id: self.id)
  end

  def local_events
    Event.where(location_id: self.id)
  end

end
