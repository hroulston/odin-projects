#Implement a method #substrings that takes a word as the first argument 
#and then an array of valid substrings (your dictionary) as the second argument. 
#It should return a hash listing each substring (case insensitive) that was found 
#in the original string and how many times it was found.
#Next, make sure your method can handle multiple words:

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (word, list)
  word_count = Hash.new(0)
  new_word = word.gsub(/[^a-zA-Z]/, " ")

  list.each do |a| 
    count = new_word.scan(/#{a}/i).length
    word_count[a] = count unless count == 0
  end

  word_count
  
end