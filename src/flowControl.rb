
age = 12
# if and elsif

if (age >= 5) && (age <= 6)
  puts "You're likely in kindergarten"
elsif (age >= 7) && (age <= 13)
  puts "You're likely in middle school"
  puts 'Enjoy'
else
  puts "I don't know what grade, if any, you are in"
end

# unless and else.
# This one is difficult to read at first, but iis basically a not if.  If you are
# Going to use an else statement, then I think if makes more sense.
unless (age > 4)
  puts 'no school'
else
  puts 'school'
end

# You can even print output only if some condition is met.
puts 'Younger than 30' if (age < 30)

# There are case statements
language = 'Italiano'
case language
when 'italiano', 'Italiano', 'italian'
  puts 'Buongiorno'
  exit
when 'english', 'English'
  puts 'Good morning'
  exit
else
  puts 'uga bugga'
end