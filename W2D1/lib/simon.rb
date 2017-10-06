class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
  end

  def take_turn
      add_random_color
      show_sequence
      require_sequence
      
      round_success_message
  end

  def show_sequence
    seq.each do |color|
      system 'clear'
      puts color
      sleep(1)
    end
  end

  def require_sequence
    seq.each_with_index do |color, i|
      print "What is color \##{i + 1}: "
      answer = gets.chomp.strip.downcase
      unless answer == color
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Round #{sequence_length} complete! Prepare for next round!"
    sleep(2)
  end

  def game_over_message
    puts "You lose, but you got up to #{sequence_length} colors!"
  end

  def reset_game

  end
end
