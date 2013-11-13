class AddIdToPart < ActiveRecord::Migration
  def change
    add_column :tickets, :movie_id, :integer
  end
end
