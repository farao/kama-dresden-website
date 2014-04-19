class AddCourseDateIdToPlace < ActiveRecord::Migration
  def change
    add_column :places, :course_date_id, :integer
  end
end
