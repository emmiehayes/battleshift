class TurnProcessor
  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
  end

  def run!
    begin
      attack_player_2
      attack_player_1
      # ai_attack_back
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target
  
  def attack_player_2
    result = Shooter.fire!(board: game.player_2_board, target: target)
    @messages << "Your shot resulted in a #{result}."
    game.player_1_turns += 1
  end

  def attack_player_1
    result = Shooter.fire!(board: game.player_1_board, target: target)
    @messages << "Your shot resulted in a #{result}."
    game.player_2_turns += 1
  end
end

# def ai_attack_back
#   result = AiSpaceSelector.new(player.board).fire!
#   @messages << "The computer's shot resulted in a #{result}."
#   game.player_2_turns += 1
# end

# def player_1
#   Player.new(game.player_1_board)
# end

# def player_2
#   Player.new(game.player_2_board)
# end