class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name_ca
      t.string :name_es
      t.string :name_en
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
