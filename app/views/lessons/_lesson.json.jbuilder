json.extract! lesson, :id, :section_id, :position, :title, :content, :image, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)