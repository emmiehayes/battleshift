FactoryBot.define do
  factory :game do
    player_1_board "You should add a board object"
    player_2_board "You should add a board object"
    winner nil
    current_turn "challenger"
  end
end

  t.string "player_1"
    t.string "player_2"
    t.text "player_1_board"
    t.text "player_2_board"
    t.integer "player_1_ships_down", default: 0
    t.integer "player_2_ships_down", default: 0
    t.integer "current_turn", default: 0
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false