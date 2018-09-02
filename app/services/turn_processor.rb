class TurnProcessor
  attr_reader :previous_turn
  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
  end

  def run!
    begin
      attack
      game.save!
    # rescue InvalidAttack => e
    #   @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  def switch_turn 
    if game.current_turn == 'player_1'
      game.current_turn = 'player_2'
    else 
      game.current_turn = 'player_1'
    end
  end
  
  private
  attr_reader :game, :target
  
  def attack
    if game.current_turn == 'player_1'
      result = Shooter.fire!(board: game.player_2_board, target: target)
      @messages << "Your shot resulted in a #{result}."
      game.player_1_turns += 1
    elsif game.current_turn == 'player_2'
      result = Shooter.fire!(board: game.player_1_board, target: target)
      @messages << "Your shot resulted in a #{result}."
      game.player_2_turns += 1 
    end
  end
end