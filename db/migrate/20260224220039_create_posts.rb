class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content
      t.boolean :is_active, default: true
      t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
