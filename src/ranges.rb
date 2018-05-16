# Ranges are defined with (..[.])
assert_equal Range, (1..5).class
# A range is not an array
assert_not_equal [1,2,3,4,5], (1..5)
# you can convert a range to an array using to_a
assert_equal [1,2,3,4,5], (1..5).to_a
# use three dots to not include the last element
assert_equal [1,2,3,4], (1...5).to_a


# lets look at slicing arrays using ranges
array = [:peanut, :butter, :and, :jelly]
# Straight forward
assert_equal [:peanut, :butter, :and], array[0..2]
# Not including the last element
assert_equal [:peanut, :butter], array[0...2]
# What does this mean?  Note that here we start at 2 and go to -1, which if you recall is the last element because it
# wraps around.
assert_equal [:and, :jelly], array[2..-1]
# starting at 1 and grabs all between (inclusive) 1 and -2, which is the second to last element.
assert_equal [:butter, :and], array[1..-2]
# starting at 1 and grabs all between (inclusive) 1 and -1, which is the last element.
assert_equal [:butter, :and, :jelly], array[1..-1]