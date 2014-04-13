class CourseDate < ActiveRecord::Base
  belongs_to :course, dependent: :destroy

  #validates :course, presence: true
  validates :time, presence: true
  validate :place, presence: true
end
