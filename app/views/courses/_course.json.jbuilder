json.extract! course, :id, :name, :image, :price, :created_at, :updated_at
json.url course_url(course, format: :json)