require 'jaccard'

a = [1, 2, 3]
b = [1, 2]
c = [1, 3]

best_match = Jaccard.best_match([a, b, c]) #=> [[1, 2, 3], [1, 2]]
puts "best_match: #{best_match}"

closest_to_b = Jaccard.closest_to(b, [a, c]) #=> [1, 2, 3]
puts "closest_to_b: #{closest_to_b}"


d = [1, 2, 3, 4]
e = [1, 3, 4]

coefficient_d_e = Jaccard.coefficient(d, e) #=> 0.75
puts "coefficient_d_e: #{coefficient_d_e}"

distance_d_e = Jaccard.distance(d, e) #=> 0.25
puts "distance_d_e: #{distance_d_e}"
