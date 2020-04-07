def anagrams?(a_string, another_string)
  to_char_array(a_string).sort == to_char_array(another_string).sort
end

def anagrams_on_steroids?(a_string, another_string)
  # 1. We create hashes with keys being our string letters
  #    and value being our the letter frequency in the string
  a_string_frequencies = to_frequency_hash(a_string)
  another_string_frequencies = to_frequency_hash(another_string)

  # 2.For each key's value (=frequency) of our first hash,
  #   we compare if the frequency is the same in the second hash
  a_string_frequencies.each do |letter, frequency|
    return false unless frequency == another_string_frequencies[letter]
  end
  true
end

# This method produce array of characters from our strings
def to_char_array(a_string)
  a_string.downcase.gsub(/[^a-zA-Z]/, '').chars
end

def to_frequency_hash(a_string)
  a_string_frequencies = Hash.new(0)
  to_char_array(a_string).each do |char|
    a_string_frequencies[char] += 1
  end
  a_string_frequencies
end

### Benchmark
# $ ruby lib/anagrams.rb

require 'benchmark'

first_string = (0...1_000_000).map { rand(65...91).chr }.join
second_string = first_string.chars.shuffle.join

puts "#anagrams? should be O(n * log n)"
puts(Benchmark.measure { anagrams?(first_string, second_string) })

puts "#anagrams_on_steroids? should be O(n)"
puts(Benchmark.measure { anagrams_on_steroids?(first_string, second_string) })
