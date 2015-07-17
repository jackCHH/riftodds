class AddChampionsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :c1, :string
    add_column :players, :c2, :string
    add_column :players, :c3, :string
    add_column :players, :c4, :string
    add_column :players, :c5, :string
  end
end
