class CreateSubcourses < ActiveRecord::Migration[5.0]
  def change
    create_table :subcourses do |t|
      t.integer :course_id
      t.string :name
      t.decimal :duration
      t.decimal :videos_duration
      t.string :library_image
      t.string :intro_video_hd
      t.string :intro_video_sd
      t.string :intro_video_image
      t.string :locale
      t.string :region
      t.boolean :visible

      t.timestamps
    end
  end
end
