require_relative 'myColorize'
require_relative 'gen_colors'
require_relative 'messages'
require_relative 'common_elements'

class MastermindGame
  include GenerateColors
  attr_reader :difficulty_level

  def initialize(diff_level = 4)
    @rand_colors = gen_colors(diff_level)
    @beginning_time = Time.now
    @guess_amount = 0
    @messaging = Messages.new
    @difficulty_level = diff_level
    @cheater = false
  end

  def win(guess)
    total_time = Time.now - @beginning_time
    total_time = total_time.to_i.abs
    split = total_time.divmod(60)
    minutes = split[0]
    seconds = split[1]

    @messaging.win_message(guess, total_time, minutes, seconds, @guess_amount, @cheater)
  end

  def compare(guess, correct)
    @correct_place = []
    @correct_colors = nil

    temp = guess.dup

    @correct_place = guess.split('').zip(correct).map { |x,y| x == y }
    @correct_place.delete(false)
    chars_in_correct_place = @correct_place.count

    @correct_colors = correct.count do |color|
      temp.include? color
      temp.slice!(color)
    end

    # jon b and I made this custom array mothod to do what I just did above
    # @correct_colors = guess.split('').common_elements(correct)

    @messaging.guess_result(@correct_colors, @correct_place, guess, @guess_amount)
  end

  def validate_input(guess)
    if guess == @rand_colors.join
      @guess_amount += 1
      win(guess)
    end

    if guess.length == @difficulty_level
      @guess_amount += 1
      compare(guess, @rand_colors)

    elsif guess == 'q' or guess == 'quit'
      @messaging.quit_message(@cheater)

    elsif guess == 'c' or guess == 'cheat'
      cheat

    elsif guess.length < @difficulty_level
      @messaging.too_short(@difficulty_level)

    elsif guess.length > @difficulty_level
      @messaging.too_long(@difficulty_level)

    else
      @messaging.enter_valid_command
    end
  end

  def play
    guess = gets.chomp.downcase
    validate_input(guess)
  end

  def instructions
    @messaging.instruction_message
  end

  def quit
    @messaging.quit_message(@cheater)
  end

  def cheat
    @cheater = true
    @messaging.cheat_message(@rand_colors)
  end
end
