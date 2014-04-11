json.array!(@courses) do |course|
  json.extract! course, :name, :description, :instructor, :category_id
  json.url course_url(course, format: :json)
end
