class Event < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  has_many :event_attendees
  has_many :attendees, through: :event_attendees

  validates :name, presence: true
  validates :host_id, presence: true
  validates :time, presence: true
  validates :location_id, presence: true

  def self.up_coming
    Event.where("time > ?", DateTime.now)
  end
end
