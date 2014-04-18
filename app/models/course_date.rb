class CourseDate < ActiveRecord::Base
  attr_accessor :new_place_name, :new_place_lat, :new_place_lon
  belongs_to :course, dependent: :destroy

  #validates :course, presence: true
  validates :time, presence: true
  validate :place, presence: true
end
