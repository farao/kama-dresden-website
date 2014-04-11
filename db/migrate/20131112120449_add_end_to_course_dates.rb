class AddEndToCourseDates < ActiveRecord::Migration
  def change
    add_column :course_dates, :end, :datetime
  end
end
