module CoursesHelper
  def link_to_add_course_date(name, f)
    new_object = CourseDate.new
    id = new_object.object_id
    fields = f.fields_for(:course_dates, new_object, child_index: id) do |builder|
      render("courses/course_date_fields", f: builder)
    end
    link_to(name, 'javascript:void(0)', class: "btn add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
