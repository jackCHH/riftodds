class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :p1
      t.string :p2
      t.string :p3
      t.string :p4
      t.string :p5

      t.timestamps null: false
    end
  end
end
