class Player
  attr_reader :board, :api_key

  def initialize(user = nil, board)
    @id       = user.id 
    @username = user.name
    @email    = user.email
    @api_key  = user.api_key
    @board    = board
  end
end
