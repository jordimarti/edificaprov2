json.extract! purchase, :id, :user_id, :course_id, :terms_of_service, :paid, :refund, :price, :promotion_code, :bill_number, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)