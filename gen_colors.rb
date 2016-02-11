module GenerateColors
  def gen_colors(diff_level = 4)
    beginner = ["r", "g", "b", "y"]
    intermediate = ["r", "g", "b", "y", "m"]
    advanced = ["r", "g", "b", "y", "m", "c"]
    rand_colors = []

    if diff_level == 4
      diff_level.times do
        rand_colors.push(beginner.sample)
      end

    elsif diff_level == 6
      diff_level.times do
        rand_colors.push(intermediate.sample)
      end

    elsif diff_level == 8
      diff_level.times do
        rand_colors.push(advanced.sample)
      end
    end
    rand_colors
  end
end
