class Player
  attr_reader :board, :username

  def initialize(user = nil, board)
    @id = user.id 
    @username = user.name
    @email = user.email
    @api_key = user.api_key
    @board = board
  end
end
