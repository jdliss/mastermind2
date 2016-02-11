require_relative 'mastermind_game'

class Messages
  def intro_message
    puts "Would you like to #{"(p)lay".green}, read the #{"(i)nstructions".yellow},\
 or #{"(q)uit?".red}"
  end

  # Is there a way to get the string to not be split in the middle of a word
  # when it reaches the right side of the terminal?
  def instruction_message
    puts "\nMASTERMIND is a color guessing game where the computer generates a \
random string of four characters representing the base colors #{"(r)ed".red}, \
#{"(g)reen".green}, #{"(b)lue".blue}, and/or #{"(y)ellow".yellow}. \
The intermediate difficulty level is six characters and adds \
#{"(m)agenta".magenta} and the advanced difficulty level is eight characters \
and adds #{"(c)yan".cyan}. \
The string is only guaranteed to contain one color.  The player must submit \
guesses to try to find the generated combination.  Guesses are not case sensitive."

    puts "\nEnter #{"(p)lay".green}, #{"(i)nstructions".yellow} or #{"(q)uit".red}"
  end

  def win_message(guess, total_time, minutes, seconds, guess_amount, cheater)
    if cheater == false
      abort("Congratulations!  You guessed the sequence '#{guess.upcase}' in #{guess_amount} \
guesses over #{minutes} minute(s) and #{seconds} seconds.".green)
    else
    abort("#{"Congratulations, cheater!".red}  #{"You 'guessed' the sequence \
'#{guess.upcase}' in #{guess_amount} guesses over #{minutes} minutes and \
#{seconds} seconds!".green}")
    end
  end

  def play_intro(diff)
    if diff == 4
      puts "\nI have generated a beginner sequence with four elements made up of: \
#{"(r)ed".red}, #{"(g)reen".green}, #{"(b)lue".blue} and #{"(y)ellow".yellow}.
Use (q)uit at any time to end the game.\n
What's your guess? (Enter any combination of #{"r".red}/#{"g".green}/\
#{"b".blue}/#{"y".yellow})"

      elsif diff == 6
        puts "\nI have generated an intermediate sequence with six elements made up of: \
#{"(r)ed".red}, #{"(g)reen".green}, #{"(b)lue".blue}, #{"(y)ellow".yellow} and \
#{"(m)agenta".magenta}.
Use (q)uit at any time to end the game.\n
What's your guess? (Enter any combination of #{"r".red}/#{"g".green}/\
#{"b".blue}/#{"y".yellow}/#{"m".magenta})"

      elsif diff == 8
        puts "\nI have generated an advanced sequence with eight elements made up of: \
#{"(r)ed".red}, #{"(g)reen".green}, #{"(b)lue".blue}, #{"(y)ellow".yellow}, \
#{"(m)agenta".magenta} and #{"(c)yan".cyan}
Use (q)uit at any time to end the game.\n
What's your guess? (Enter any combination of #{"r".red}/#{"g".green}/\
#{"b".blue}/#{"y".yellow}/#{"m".magenta}/#{"c".cyan})"
    end
  end

  def cheat_message(colors)
    puts "\nHERE'S A HAIKU ENTITLED: #{"CHEATER".red}"
    puts "\nYOU ARE A CHEATER
I AM REPORTING YOU TO
THE GAME COMMISSION".red
    puts "\n(#{colors.join.upcase})"
  end

  def enter_valid_command
    puts "Please enter a valid guess or command".red
  end

  def too_short(diff_level)
    puts "\nYour guess is too short. It should be #{diff_level} characters.".red
  end

  def too_long(diff_level)
    puts "\nYour guess is too long. It should be #{diff_level} characters.".red
  end

  def quit_message(cheater)
    if cheater == false
      abort("Thanks for playing!")
    else
      abort("Good riddance, cheater")
    end
  end

  def guess_result(correct_colors, correct_place, guess, guess_amount)
    puts "'#{guess.upcase}' has #{correct_colors} of the correct elements with\
 #{correct_place.count} in the correct positions."
 if guess_amount == 1
      puts "You've taken 1 guess."
    else
      puts "You've taken #{guess_amount} guesses."
    end
  end

end
