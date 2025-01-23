dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(word, dictionary)
  my_hash = Hash.new(0)
  str = ' '
  new_word = word.downcase
  dictionary.each_with_index do |_element, value|
    if new_word.scan(dictionary[value]) != []
      words = new_word.scan(dictionary[value])
      my_hash[words[0]] = words.length
      str = my_hash
    else
      str = 'NO SUBSTRINGS FOUND'
    end
  end``
  puts ''
  puts str
  puts ''
end

substrings("Howdy partner, sit down! How's it going?", dictionary)
