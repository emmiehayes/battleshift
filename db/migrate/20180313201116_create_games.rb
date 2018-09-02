class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string  :player_1
      t.string  :player_2
      t.text    :player_1_board
      t.text    :player_2_board
      t.integer :player_1_ships_down, default: 0
      t.integer :player_2_ships_down, default: 0
      t.integer :current_turn, default: 0
      t.string  :winner

      t.timestamps
    end
  end
end
