json.extract! promotion, :id, :course_id, :code, :price, :single_use, :used, :created_at, :updated_at
json.url promotion_url(promotion, format: :json)