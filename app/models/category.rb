class Category < ActiveRecord::Base
  has_many :courses

  validates :name, presence: true
  #validates :color, presence: true
end
