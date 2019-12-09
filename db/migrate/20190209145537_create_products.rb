class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :product_url, null: false
      t.text :text
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
