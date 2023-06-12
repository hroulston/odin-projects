#Implement a method #substrings that takes a word as the first argument 
#and then an array of valid substrings (your dictionary) as the second argument. 
#It should return a hash listing each substring (case insensitive) that was found 
#in the original string and how many times it was found.
#Next, make sure your method can handle multiple words:

dictionary = ["how", "come", "be", "ever", "eve"]

def substrings (word, list)
  word_count = Hash.new(0)
  list.each { |a| word_count[a] += 1 if word.include?(a)}
  word_count
end