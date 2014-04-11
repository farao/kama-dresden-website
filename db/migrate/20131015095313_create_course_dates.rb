class CreateCourseDates < ActiveRecord::Migration
  def change
    create_table :course_dates do |t|
      t.datetime :time
      t.text :place
      t.integer :course_id

      t.timestamps
    end
  end
end
