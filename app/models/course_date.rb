class CourseDate < ActiveRecord::Base
  attr_accessor :new_place_name, :new_place_lat, :new_place_lon
  belongs_to :course, dependent: :destroy
  has_many :places

  #validates :course, presence: true
  validates :time, presence: true
  validates :place, presence: true
end
