require_relative 'mastermind_game'
require_relative 'gen_colors'
require_relative 'myColorize'
require_relative 'messages'

messaging = Messages.new
puts "\nWelcome to MASTERMIND"

difficulty = nil
until difficulty.class == Fixnum and difficulty != 0 and
  difficulty == 4 or difficulty == 6 or difficulty == 8
  puts "\nPlease select a difficulty level."
  puts "4 = Beginner, 6 = intermediate, 8 = advanced"
  difficulty = gets.chomp.to_i
end

mastermind = MastermindGame.new(difficulty)
messaging.intro_message
input = gets.chomp


i = 0
loop do
  if input.downcase == 'p' or input.downcase == 'play'
    if i == 0
      messaging.play_intro(mastermind.difficulty_level)
      mastermind.play
      i += 1
    else
      puts "\nMake your next guess"
      mastermind.play
    end

  elsif input.downcase == 'i' or input.downcase == 'instructions'
    mastermind.instructions
    input = gets.chomp

  elsif input.downcase == 'q' or input.downcase == 'quit'
    mastermind.quit

  else
    puts "Please enter (p)lay, (i)nstructions or (q)uit".red
    input = gets.chomp
  end
end
