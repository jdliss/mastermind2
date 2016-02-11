require_relative 'common_elements'

# correct = ["r", "r", "g", "b", "m", "b", "c", "b"]
#
# temp = ["r", "r", "g", "r", "b", "b", "m", "b"]

correct = []
temp = []
10000.times do
  correct << "qwertyuioplkjhgfdsazxcvbnm1234567890".split('').sample
end
10000.times do
  temp << "qwertyuioplkjhgfdsazxcvbnm1234567890".split('').sample
end

beginning_time1 = Time.now
@correct_colors = correct.count do |color|
  temp.include? color
  temp.join.slice!(color)
end

end_time = Time.now


beginning_time2 = Time.now
@correct_colors = temp.common_elements(correct)
end_time2 = Time.now

puts "Our method: " + ((end_time2 - beginning_time2) *1000.0).to_s
puts "With .count and .include? and .slice!: " + ((end_time - beginning_time1) * 1000.0).to_s
