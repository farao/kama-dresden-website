class Course < ActiveRecord::Base
  has_many :course_dates
  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :course_dates, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence:true
  validates :user, presence:true
  validates :course_dates, presence: true

  def self.between(start_date, end_date)
    joins(:course_dates).where(course_dates: {time: start_date..end_date})
  end
end
