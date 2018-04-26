# Writing to a file
file_name = 'temp_file_for_ruby_read_write_example.out'
write_handler = File.new(file_name, 'w');

write_handler.puts('Here is a file with some content, but not enough to be content.').to_s

write_handler.close

# Reading from a file
data_from_file = File.read(file_name)

puts 'Data From File: ' + data_from_file

# Prints out a blank line, better to append probably, but
puts

# Executing code from another ruby file
load 'floats.rb'