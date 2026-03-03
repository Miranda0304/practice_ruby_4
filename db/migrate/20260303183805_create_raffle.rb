class CreateRaffle < ActiveRecord::Migration[8.1]
  def change
    create_table :raffles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :description
      t.string :prize
      t.integer :total_numbers, default: 0
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :number_per_page, default: 50
      t.string :url_icon
      t.integer :limit_to_finish
      t.date :start_date
      t.date :end_date
      t.integer :number_winner
      t.string :url_evidence
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
