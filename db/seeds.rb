user_1= User.create!(name: 'Sophie', email: ENV['BATTLESHIFT_EMAIL'], email_confirmed: true, password: '2345', api_key: ENV['BATTLESHIFT_API_KEY'])
user_2= User.create!(name: 'Michelle', email: ENV['BATTLESHIFT_OPPONENT_EMAIL'], email_confirmed: true, password: '1344', api_key: ENV['BATTLESHIFT_OPPONENT_API_KEY'])

# player_1_board = Board.new(4)
# player_2_board = Board.new(4)

# sm_ship = Ship.new(2)
# md_ship = Ship.new(3)

# # Place Player 1 ships
# ShipPlacer.new(board: player_1_board,
#                ship: sm_ship,
#                start_space: "A1",
#                end_space: "A2").run

# ShipPlacer.new(board: player_1_board,
#                ship: md_ship,
#                start_space: "B1",
#                end_space: "D1").run

# # Place Player 2 ships
# ShipPlacer.new(board: player_2_board,
#                ship: sm_ship.dup,
#                start_space: "A1",
#                end_space: "A2").run

# ShipPlacer.new(board: player_2_board,
#                ship: md_ship.dup,
#                start_space: "B1",
#                end_space: "D1").run

# game_attributes = {
#   player_1_board: player_1_board,
#   player_2_board: player_2_board,
#   current_turn: "challenger"
# }

# game = Game.new(game_attributes)
# game.save!
