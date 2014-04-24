class Place < ActiveRecord::Base
  belongs_to :course_date

  validates :name, presence: true, uniqueness: true
  validates :lat, presence: true
  validates :lon, presence: true

  def self.remembered
    where(remember: true)
  end
end
