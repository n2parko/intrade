class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :size
      t.integer :price
      t.boolean :buy
      t.boolean :onmarket
      t.integer :movie_id

      t.timestamps
    end
  end
end
