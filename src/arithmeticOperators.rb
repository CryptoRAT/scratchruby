# Let's look at some arithmetic operators and results in ruby.
puts '6 + 4  = ' + (6+4).to_s
puts '6 - 4  = ' + (6-4).to_s
puts '6 * 4  = ' + (6*4).to_s
puts '6 / 4  = ' + (6/4).to_s
puts '6 % 4  = ' + (6%4).to_s
puts '6 ** 4 = ' + (6 ** 4).to_s

# in this case we are sending the message, sqrt(9) to the Math receiver.
puts 'Math.sqrt(9) = ' + (Math.sqrt(9)).to_s

# Blank line
puts
puts "Now let's swap the digits."
puts '4 + 6 = ' + (4+6).to_s
puts '4 - 6 = ' + (4-6).to_s
puts '4 * 6 = ' + (4*6).to_s
puts '4 / 6 = ' + (4/6).to_s
puts '4 % 6 = ' + (4%6).to_s
puts '4 ** 6 = ' + (4 ** 6).to_s