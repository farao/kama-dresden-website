class Place < ActiveRecord::Base
  belongs_to :course_date

  validates :name, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
end
