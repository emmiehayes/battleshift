class Player
  attr_reader :board

  def initialize(user = nil, board)
    @username = user.name if user
    @board = board
  end
end
