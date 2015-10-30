module FunWithStrings
  def palindrome?
    stripped_string = self.gsub(/[^[:alnum:]]/, "").downcase
    stripped_string.reverse==stripped_string
  end
  
  def count_words
    stripped_string_array = self.gsub(/[^[:alnum:]|\s]/,"").downcase.split
    word_hash=Hash.new(0)
    stripped_string_array.each {|word| word_hash[word]+=1}
    word_hash
  end
  
  def anagram_groups
    word_array = self.downcase.split
    # http://stackoverflow.com/questions/2698460/strange-behavior-when-using-hash-default-value-e-g-hash-new
    word_hash=Hash.new([])
    word_array.each do |word|
      word_hash[word.chars.sort.join] +=[word]
    end 
    word_hash.values
  end
  
end

# make all the above functions available as instance methods on Strings:
class String
  include FunWithStrings
end
