class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.integer :subcourse_id
      t.integer :position
      t.string :title

      t.timestamps
    end
  end
end
