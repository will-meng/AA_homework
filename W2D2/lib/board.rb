class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups[0..5] = Array.new(6) { [:stone, :stone, :stone, :stone] }
    cups[7..12] = Array.new(6) { [:stone, :stone, :stone, :stone] }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 5) ||
                                        start_pos.between?(7, 12)
  end

  def make_move(start_pos, current_player_name)
    # pick up stones from start_pos
    num_stones = cups[start_pos].length
    cups[start_pos] = []

    # iterate until no more stones in hand
    current_cup = start_pos + 1
    until num_stones.zero?
      if (current_cup == 6 && current_player_name == @name2) ||
         (current_cup == 13 && current_player_name == @name1)
        current_cup = (current_cup + 1) % 14
        next
      end

      cups[current_cup] << :stone
      num_stones -= 1
      current_cup = (current_cup + 1) % 14
    end

    render
    ending_cup_idx = current_cup.zero? ? 13 : current_cup - 1
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if [6, 13].include?(ending_cup_idx)
      :prompt
    elsif cups[ending_cup_idx].length <= 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |idx| cups[idx] == [] } ||
    (7..12).all? { |idx| cups[idx] == [] }
  end

  def winner
    player_1_stones = cups[6].length
    player_2_stones = cups[13].length
    case player_1_stones <=> player_2_stones
    when 0
      :draw
    when -1
      @name2
    else
      @name1
    end
  end
end
