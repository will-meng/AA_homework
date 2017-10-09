require 'colorize'

class Simon
  COLORS = %w[red blue green yellow]
  COLORED = ['red'.colorize(:red),
            'blue'.colorize(:blue),
            'green'.colorize(:green),
            'yellow'.colorize(:yellow)]
  COLOR_HASH = { red: 'red', r: 'red', blue: 'blue', b: 'blue',
                 green: 'green', g: 'green', yellow: 'yellow', y: 'yellow' }


  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    return if game_over
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts "Prepare for round \##{sequence_length}..."
    sleep(2)
    system 'clear'
    seq.each do |color|
      puts COLORED[COLORS.index(color)]
      sleep(0.75)
      system 'clear'
      sleep(0.25)
    end
  end

  def require_sequence
    seq.each_with_index do |color, i|
      answer = nil
      loop do
        print "What is color \##{i + 1}: "
        answer = gets.chomp.strip.downcase
        break if COLOR_HASH.keys.include?(answer.to_sym)
        puts "Invalid color. Please try again."
      end

      unless COLOR_HASH[answer.to_sym] == color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Round #{sequence_length} complete! Prepare for next round!"
  end

  def game_over_message
    puts "You lose, but you got up to #{sequence_length} colors!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play if $PROGRAM_NAME == __FILE__
