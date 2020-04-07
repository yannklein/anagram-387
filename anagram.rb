require 'benchmark'

# a_string and another_string are string of n letters

def anagrams?(a_string, another_string)
  a_splitted_string = standardize_string(a_string).split('')              #=> O(n): operation done on each of the n letters
  another_splitted_string = standardize_string(another_string).split('')  #=> O(n): operation done on each of the n letters
  a_splitted_string.sort == another_splitted_string.sort                  #=> O(n*log(n)): .sort can sort an array of n elements in n*log(n) operations
end

# anagram? overall performance is O(n * log n)

def standardize_string(string)
  string.gsub(/[\W\s]+/, "").downcase
end

def anagrams_on_steroids?(a_string, another_string)
  a_string_count = Hash.new(0)                                #=> O(1): one unique operation
  another_string_count = Hash.new(0)                          #=> O(1): one unique operation

  standardize_string(a_string).each_char do |char|            #=> O(n): operation done on each of the n letters
  # Note: .each_char == .split("").each
    a_string_count[char] += 1
  end

  standardize_string(another_string).each_char do |char|      #=> O(n): operation done on each of the n letters
  # Note: .each_char == .split("").each
    another_string_count[char] += 1
  end

  # a_string_count == another_string_count
  a_string_count.each do |key, value|                         #=> O(1): operation done 26 times
    return false if another_string_count[key] != value
  end
  true
end

# anagrams_on_steroids? overall performance is O(n)

# ####
# Benchmark
# #####

first_string = (1..1_000_000).map { |num| Array("a"..."z").sample }.join
second_string = first_string.split('').shuffle.join

puts "#anagrams? should be O(n * log n)"
puts(Benchmark.measure { anagrams?(first_string, second_string) })

puts "#anagrams_on_steroids? should be O(n)"
puts(Benchmark.measure { anagrams_on_steroids?(first_string, second_string) })
