class ShipPlacer

  def initialize(params, board)
    @board       = board
    @ship        = Ship.new(params[:ship_size])
    @start_space = params[:start_space]
    @end_space   = params[:end_space]
    @placed      = []
  end

  def message
    @msg
  end

  def run
    if same_row?
      place_in_row
    elsif same_column?
      place_in_column
    else
      raise InvalidShipPlacement.new("Ship must be in either the same row or column.")
    end
  end

  private
  attr_reader :board, :ship, :start_space, :end_space

  def same_row?
    start_space[0] == end_space[0]
  end

  def same_column?
    start_space[1] == end_space[1]
  end

  def place_in_row
    row = start_space[0]
    range = start_space[1]..end_space[1]
    @msg = "Ship size must be equal to the number of spaces you are trying to fill."
    raise InvalidShipPlacement unless range.count == ship.length
    range.each { |column| place_ship(row, column) }
  end

  def place_in_column
    column = start_space[1]
    range   = start_space[0]..end_space[0]
    raise InvalidShipPlacement unless range.count == ship.length
    range.each { |row| place_ship(row, column) }
  end

  def place_ship(row, column)
    coordinates = "#{row}#{column}"
    space = board.locate_space(coordinates)
    if space.occupied?
      raise InvalidShipPlacement.new("Attempting to place ship in a space that is already occupied.")
    else
      space.occupy!(ship)
      @placed << ship
      @msg = "Successfully placed ship with a size of #{ship.length}. You have 1 ship(s) to place with a size of 2."
    end
    @msg = "Successfully placed ship with a size of 2. You have 0 ship(s) to place." if @placed.count == 2
  end
end

class InvalidShipPlacement < StandardError
  def initialize(msg = "Invalid ship placement")
    @msg = msg
    super
  end
end
