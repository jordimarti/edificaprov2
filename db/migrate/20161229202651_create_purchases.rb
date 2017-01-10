class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :terms_of_service
      t.boolean :paid
      t.boolean :refund
      t.integer :price
      t.string :promotion_code
      t.integer :bill_number

      t.timestamps
    end
  end
end
