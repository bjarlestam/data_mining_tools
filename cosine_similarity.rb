module SimilarityCalculator

  def self.get_similarity(vector1, vector2)
    dp = dot_product(vector1, vector2)
    nm = normalize(vector1) * normalize(vector2)
    dp / nm
  end

  private

  def self.dot_product(vector1, vector2)
    sum = 0.0
    vector1.each_with_index { |val, i| sum += val * vector2[i] }
    sum
  end

  def self.normalize(vector)
    Math.sqrt(vector.inject(0.0) { |m,o| m += o**2 })
  end

end


items = [
  { id: 1, vector: [0,0,0,2,3,0,0] },
  { id: 2, vector: [0,1,0,1,5,0,0] },
  { id: 3, vector: [2,3,0,0,0,1,0] },
  { id: 4, vector: [1,2,4,6,5,0,0] }
]

search_vector = [1,0,0,3,5,0,0]
items.each do |item|
  rank = SimilarityCalculator.get_similarity(search_vector, item[:vector])
  puts "item #{item[:id]}, rank #{rank}"
end
