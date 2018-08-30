class Player
  attr_reader :board

  def initialize(user)
    @email = user.email 
    @board = Board.new()
    binding.pry
    # @board = board
  end
end
