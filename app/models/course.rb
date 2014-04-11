class Course < ActiveRecord::Base
  has_many :course_dates
  belongs_to :category
  belongs_to :user, as: :instructor

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence:true
  validates :instructor, presence:true
  validates :has_course_dates?

  def has_course_dates?
    errors.add_to_base "Course needs at least one date" if course_dates.blank?
  end

  def self.between(start_date, end_date)
    joins(:course_dates).where(course_dates: {time: start_date..end_date})
  end
end
