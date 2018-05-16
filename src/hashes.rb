

delineator = String.new('==============================================================================')
puts delineator
puts delineator
puts 'HASHES'
puts delineator
puts 'create an empty hash --> empty_hash = Hash.new'
empty_hash = Hash.new
puts 'Verify class type is Hash -->'
puts 'empty_hash.class == Hash --> ' + (empty_hash.class == Hash).to_s
puts
puts 'Check if the hash is empty by looking at the contents -->'
puts '{} == empty_hash --> ' + ({} == empty_hash).to_s
puts
puts 'Check the size of the hash.  In this case, verify it is empty by looking at the size. -->'
puts 'empty_hash.size == 0 --> ' + (empty_hash.size == 0).to_s
puts delineator
puts delineator
puts 'HASH LITERALS'
puts delineator
puts 'Create a hash with initial values -->'
puts 'hash = { :one => "uno", :two => "dos" }'
puts hash = { :one => "uno", :two => "dos" }
puts
puts 'Check that the size is set to 2 -->'
puts 'hash.size == 2 --> ' + (hash.size == 2).to_s
puts delineator
puts delineator
puts 'ACCESSING HASHES WITH []'
puts delineator
puts 'Create a hash with initial values'
puts 'hash = { :one => "uno", :two => "dos" }'
hash = { :one => "uno", :two => "dos" }
puts
puts 'Retrieve the value for key :one -->'
puts 'hash[:one] == "uno"' + (hash[:one] == "uno").to_s
puts
puts 'Retrieve the value for key :two -->'
puts 'hash[:two] == "dos"' + (hash[:two] == "dos").to_s
puts
puts "Retrieve the value for a key that doesn't exist returns null -->"
puts 'hash[:doesnt_exist] == nil --> ' + (hash[:doesnt_exist] == nil).to_s
puts delineator
puts delineator
puts 'ACCESSING HASHES WITH FETCH'
puts delineator
puts 'Create a hash with initial values'
puts 'hash = { :one => "uno" }'
hash = { :one => "uno" }
puts
puts 'Retrieve the value for key :one -->'
puts 'hash.fetch(:one) == "uno" --> ' + (hash.fetch(:one) == "uno").to_s

puts "Trying to retrieve a value for a key that doesn't exist, raises KeyError exception. -->"
begin
  puts 'hash.fetch(:doesnt_exits)'
  puts (hash.fetch(:doesnt_exits))
  rescue KeyError
    puts 'Caught KeyError'
end
puts delineator
puts delineator
puts 'CHANGING HASHES'
puts delineator
puts 'Create a hash with initial values'
puts 'hash = { :one => "uno", :two => "dos" }'
hash = { :one => "uno", :two => "dos" }
puts 'Change the value for key :one --> '
puts 'hash[:one] = "eins" --> ' + (hash[:one] = "eins").to_s
#hash[:one] = "eins"

# expected = { :one => __, :two => "dos" }
expected = { :one => "eins", :two => "dos" }
# assert_equal __, hash
#assert_equal expected, hash
puts delineator
puts delineator
puts 'DEFAULT OBJECTS'
puts delineator
hash = Hash.new([])

hash[:one] << "uno"
hash[:two] << "dos"
puts 'hash --> ' + hash.to_s
# assert_equal __, hash[:one]
#assert_equal ["uno","dos"], hash[:one]
# assert_equal __, hash[:two]
#assert_equal ["uno","dos"], hash[:two]
# assert_equal __, hash[:three]
#assert_equal ["uno","dos"], hash[:three]