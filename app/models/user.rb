class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :courses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :admin, presence: true
  validates :instructor, presence: true

  def full_name
    first_name + ' ' + last_name
  end

  def self.dummy
    u = User.new
    u.admin = false
    u.instructor = false
    u
  end
end
