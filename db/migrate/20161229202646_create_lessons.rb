class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :subcourse_id
      t.integer :section_id
      t.integer :position
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
