class TurnProcessor

  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
  end

  def run!
    begin
      attack
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  def switch_turn
    if invalid_coordinates?
      game.current_turn = game.current_turn
    elsif game.current_turn == 'player_1'
      game.current_turn = 'player_2'
    elsif game.current_turn == 'player_2'
      game.current_turn = 'player_1'
    end
  end

  def announce_winner
    if game.player_1_ships_down == 2
      game.winner = User.find_by_api_key(game.player_2).email
    elsif game.player_2_ships_down
      game.winner = User.find_by_api_key(game.player_1).email
    end
  end

  private
  attr_reader :game, :target

  def invalid_coordinates?
    @messages.include?("Invalid coordinates.")
  end

  def attack
    if game.current_turn == 'player_1'
      result = Shooter.fire!(board: game.player_2_board, target: target)
      @messages << "Your shot resulted in a #{result}."
      game.player_2_ships_down += 1 if result.include?('sunk')
    elsif game.current_turn == 'player_2'
      result = Shooter.fire!(board: game.player_1_board, target: target)
      @messages << "Your shot resulted in a #{result}."
      game.player_1_ships_down += 1 if result.include?('sunk')
    end
    if game_over?
      @messages << "Game over."
      announce_winner
    end
  end

  def game_over?
    game.player_1_ships_down == 2 || game.player_2_ships_down == 2
  end

end
