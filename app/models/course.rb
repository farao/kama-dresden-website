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
end
