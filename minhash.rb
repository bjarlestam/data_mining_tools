# This is not the minhash technique described in minging massive data
# This one only uses one hash-function

require 'murmurhash3'

module MinHash
  Infinity = 1.0 / 0.0
  def self.minhash(history)
    val = Infinity
    Array(history).each do |item|
      n = MurmurHash3::V32.str_hash(item)
      val = n if n < val
    end
    val
  end
end


m = MinHash.minhash(["foo", "bar", "baz", "lkj", "uuu"])
puts "minhash: #{m}"

m = MinHash.minhash(["foo", "ccc", "baz"])
puts "minhash: #{m}"

#s = "hello hej kalle kula som spelar fiol och ritar bilar".shingles()
m = MinHash.minhash(["hel", "ell", "llo", "lo ", "o h", " he", "hej", "ej ",
  "j k", " ka", "kal", "all", "lle", "le ", "e k", " ku", "kul", "ula", "la ",
  "a s", " so", "som", "om ", "m s", " sp", "spe", "pel", "ela", "lar", "ar ",
  "r f", " fi", "fio", "iol", "ol ", "l o", " oc", "och", "ch ", "h r", " ri",
  "rit", "ita", "tar", "r b", " bi", "bil", "ila"])
puts "minhash: #{m}"

#s = "hello hej kalle kula som alltid spelar fiol och ritar bilar".shingles()
m = MinHash.minhash(["hel", "ell", "llo", "lo ", "o h", " he", "hej", "ej ",
  "j k", " ka", "kal", "all", "lle", "le ", "e k", " ku", "kul", "ula", "la ",
  "a s", " so", "som", "om ", "m a", " al", "llt", "lti", "tid", "id ", "d s",
  " sp", "spe", "pel", "ela", "lar", "ar ", "r f", " fi", "fio", "iol", "ol ",
  "l o", " oc", "och", "ch ", "h r", " ri", "rit", "ita", "tar", "r b", " bi",
  "bil", "ila"])
puts "minhash: #{m}"
