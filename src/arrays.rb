# create an empty array
empty_array = Array.new
# Check array size
empty_array.size

# Set a specific element in an array to a value, note they are zero indexed.
array = Array.new
array[0] = 1
array[1] = 2

# Append a value to an array.
array << 333
puts array
#assert_equal [1, 2, 333], array

# Doesn't have to be just integers.
array = [:peanut, :butter, :and, :jelly]
puts array.to_s
puts 'array[0] == :peanut --> ' + (array[0] == :peanut).to_s
puts 'array.first == :peanut --> ' + (array.first == :peanut).to_s
puts 'array[3] == :jelly --> ' + (array[3] == :jelly).to_s
puts 'array.last == :jelly --> ' + (array.last == :jelly).to_s
# note that when checking negative array values, they wrap around, not an out of bounds exception or anything like that.
puts 'array[-1] == :jelly --> ' + (array[-1] == :jelly).to_s
puts 'array[-3] == :butter --> ' + (array[-3] == :butter).to_s
# When splicing arrays, array[start, count].  Where start is where you start, and count is how many elements you get.
assert_equal [:peanut], array[0,1]
assert_equal [:peanut, :butter], array[0,2]
assert_equal [:and, :jelly], array[2,2]
assert_equal [:and, :jelly], array[2,20]
assert_equal [], array[4,0]
# if the count is greater than the available number, it returns empty array.
assert_equal [], array[4,100]
# If the start is out of bounds then return nil.
assert_equal nil, array[5,0]
# Remember, if the start is negative, it wraps around...right?
assert_equal [:jelly], array[-1,1]

# You can also push/pop from arrays
array = [1,2]
# Push something on to the array
array.push(:last)
# Now it looks like this.
assert_equal [1,2,:last], array
# Pop something off the array, saving the value
popped_value = array.pop
# This is what you popped off.
assert_equal :last, popped_value
# Now if you look at the array, here is the value.
assert_equal [1,2], array

# Similar to push/pop at the tail, there is an unshfit/shift for the head of the array.
array = [1,2]
# Use unshift to prepend a value ont to the array.
array.unshift(:first)

# Now it has this value.
assert_equal [:first, 1,2], array
# Use shift to remove a value from the head of an array.
shifted_value = array.shift
# Here is the value shifted out of the array.
assert_equal :first, shifted_value
# The remaining value of the array.
assert_equal [1,2], array

# Next we look at parallel assignment from arrays.

