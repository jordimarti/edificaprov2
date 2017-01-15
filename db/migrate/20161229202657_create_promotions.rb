class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.integer :course_id
      t.string :code
      t.integer :price
      t.boolean :single_use
      t.boolean :used

      t.timestamps
    end
  end
end
