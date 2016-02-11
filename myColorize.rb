# to avoid creating a dependency on 'colorize' gem.
# I got the idea from here (http://stackoverflow.com/a/11482430)
# figured out how it worked and grabbed color codes/formatting from here:
# (http://misc.flogisoft.com/bash/tip_colors_and_formatting)

# overload string class
class String

  # create the colorize function which takes a color code
  # use color code on self (text) and remove all other fomatting
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  # call these functions on text
  # ex: ("string".red) will call the colorize function with the color code 31
  def red
    colorize(31)
  end

  def blue
    colorize(34)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def magenta
    colorize(35)
  end

  def cyan
    colorize(36)
  end
end
