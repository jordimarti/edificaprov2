json.extract! subcourse, :id, :course_id, :name, :duration, :videos_duration, :library_image, :intro_video_hd, :intro_video_sd, :intro_video_image, :locale, :region, :visible, :created_at, :updated_at
json.url subcourse_url(subcourse, format: :json)