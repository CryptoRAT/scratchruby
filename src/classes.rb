puts 'Everything is a class'

puts 'Integers are classes:'
puts 'puts 1.class -> '
puts "\t" + 1.class.to_s

puts 'Floats are classes:'
puts 'puts 1.234.class -> '
puts "\t" + 1.234.class.to_s

puts 'Strings are classes:'
puts 'puts "A String".class -> '
puts "\t" + "A String".class.to_s

puts 'Strings are classes even with single quotes:'
puts "puts 'A String'.class -> "
puts "\t" + 'A String'.class.to_s

# Convention seems to be that if there is nothing special (things that need to be interpreted or special characters) in the string, use single quotes, otherwise use double.
