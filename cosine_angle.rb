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

x = [2,1,1]
y = [10,-7,1]

puts SimilarityCalculator.get_similarity(x,y)
