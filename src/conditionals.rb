puts 'LOGICAL OPERATORS:'
puts "\tand: &&, and"
puts "\tor: ||, or"
puts "\tnot: !, not"
puts
puts "Let's look a the truth tables.
Note that we could just use true and false with out variables (or our made up constants here)"
puts 'T = true'
puts 'N = false'
T = true
F = false
puts
puts '**, and'
puts 'T && T = ' + (T && T).to_s
puts 'T && F = ' + (T && F).to_s
puts 'F && F = ' + (F && F).to_s
puts 'F && T = ' + (F && T).to_s
puts
puts '||, or'
puts 'T || T = ' + (T || T).to_s
puts 'T || F = ' + (T || F).to_s
puts 'F || F = ' + (F || F).to_s
puts 'F || T = ' + (F || T).to_s
puts
puts '!, not'
puts '!(T && T) = ' + (!(T && T)).to_s
puts '!(T && F) = ' + (!(T && F)).to_s
puts '!(F && F) = ' + (!(F && F)).to_s
puts '!(F && T) = ' + (!(F && T)).to_s
puts


puts 'COMPARISON OPERATORS:'
puts "\tequal to: =="
puts "\tnot equal: !="
puts "\tless than: <"
puts "\tgreater than: >"
puts "\tless than or equal: <="
puts "\tgreater than or equal: >="
puts "\tcomparable mixin (-1 [less than], 0 [equal], +1 [greater than]): <=>"
puts
puts 'A = 10'
puts 'B = 20'
A = 10
B = 20
puts
# puts '(A == B): ' + (A != B).to_s
puts '(' + A.to_s + ' == ' + B.to_s + '): ' + (A == B).to_s
# puts '(A != B): ' + (A != B).to_s
puts '(' + A.to_s + ' != ' + B.to_s + '): ' + (A != B).to_s
# puts '(A < B): ' + (A < B).to_s
puts '(' + A.to_s + ' < ' + B.to_s + '): ' + (A < B).to_s
# puts '(A > B): ' + (A > B).to_s
puts '(' + A.to_s + ' > ' + B.to_s + '): ' + (A > B).to_s
# puts '(A <= B): ' + (A <= B).to_s
puts '(' + A.to_s + ' <= ' + B.to_s + '): ' + (A <= B).to_s
# puts '(A >= B): ' + (A >= B).to_s
puts '(' + A.to_s + ' >= ' + B.to_s + '): ' + (A >= B).to_s
# puts '(A <=> B): ' + (A <=> B).to_s
puts '(' + A.to_s + ' <=> ' + B.to_s + '): ' + (A <=> B).to_s
# puts '(B <=> A): ' + (B <=> A).to_s
puts '(' + B.to_s + ' <=> ' + A.to_s + '): ' + (B <=> A).to_s
# puts '(A <=> A): ' + (A <=> A).to_s
puts '(' + A.to_s + ' <=> ' + A.to_s + '): ' + (A <=> A).to_s

