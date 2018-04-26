num_one = 1.000

num_99 = 0.999

puts num_one.to_s + ' = ' + num_99.to_s + ' = ' + (num_one -num_99).to_s

puts 'You can trust float arithmetic up to about 14 digits, after that it is off, so be aware.'
big_float = 1.12345678901234
big_low_float = 0.00000000000005
puts big_float.to_s + ' + ' + big_low_float.to_s + ' = ' + (big_float + big_low_float).to_s