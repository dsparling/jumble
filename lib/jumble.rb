$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class Jumble 
  VERSION = '0.0.2'

  attr_accessor :dict

  def initialize()
    @dict = '/usr/share/dict/words'
  end

  def solve_word(word)
    return unless word
    good_words = []
    good_words_found = {}

    # Create canonical version of the word
    key = word.split("").sort.join

    # Read dictionary and get words same length as word 
    File.open(@dict, 'r') do |file|
      while (line = file.gets)
        line.chomp!.downcase!
        next if line !~ /^[a-z]+$/          # Letters only
        next if line.length != word.length # Same length as key
  
        # Create canonical version of the dict word
        line_key = line.split("").sort.join

        # If line_key and key match, we've got a good word
        if line_key == key
          unless good_words_found.has_key?(line)
            good_words << line
            good_words_found[line] = 1
         end
        end

      end
    end
    good_words
  end

  def jumble_word(word)
    return unless word
    # FIXME - check that jumbled_word is differnt from word
    jumbled_word = word.split("").sort_by{rand}.join
  end

end
