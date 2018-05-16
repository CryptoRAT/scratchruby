puts 'EVERYTHING IS A CLASS'

puts 'INTEGERS ARE CLASSES:'
puts 'puts 1.class -> '
puts "\t" + 1.class.to_s

puts 'FLOATS ARE CLASSES:'
puts 'puts 1.234.class -> '
puts "\t" + 1.234.class.to_s

puts 'STRINGS ARE CLASSES:'
puts 'puts "A String".class -> '
puts "\t" + "A String".class.to_s

puts 'STRINGS ARE CLASSES EVEN WITH SINGLE QUOTES:'
puts "puts 'A String'.class -> "
puts "\t" + 'A String'.class.to_s

# Convention seems to be that if there is nothing special (things that need to be interpreted or special characters) in the string, use single quotes, otherwise use double.

# Have you seen something like this:
puts 'RECOGNIZING INHERITANCE'
puts "class ClassName < Library::Method"
puts "Means ClassName inherits from Library::Method"

# what about using nil?.  Turns out that an object is not nil, but a nil object is nil.
puts 'USING nil?, all the objects (except nil objects) will return false to the .nil?'
puts 'Object.nil?: ' + Object.nil?.to_s
puts "'A String'.nil?: " + 'A String'.nil?.to_s
puts 'nil.nil?: ' + nil.nil?.to_s
