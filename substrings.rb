#Implement a method #substrings that takes a word as the first argument 
#and then an array of valid substrings (your dictionary) as the second argument. 
#It should return a hash listing each substring (case insensitive) that was found 
#in the original string and how many times it was found.
#Next, make sure your method can handle multiple words:

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (word, list)
  word_count = {}
  new_word = word.gsub(/[^a-zA-Z]/, "")

  list.each do |a| 
    if matched_word?(new_word, a)
      if word_count[a]
        puts a
        puts word_count[a]
        puts word_count
        word_count[a] += 1 
      else
        puts word_count
        word_count[a] = 1
      end
    end
  end
  word_count
  # new_word
end

def matched_word?(new_word, a)
  /#{a}/i.match(new_word)
end