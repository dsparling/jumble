$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class Jumble

  attr_accessor :dict, :num_words

  def initialize(dict='/usr/share/dict/words')
    @dict                      = dict
    @num_words                 = 5
    @_word_lengths_allowed     = {}
    @_word_lengths_not_allowed = {}
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
        next if line !~ /^[a-z]+$/         # Letters only
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
    begin
      jumbled_word = word.split("").sort_by{rand}.join
    end while jumbled_word == word
  end


  def create_jumble

    words = {}

    # Read dictionary and get words same length as word
    File.open(@dict, 'r') do |file|
      while (line = file.gets)
        line.chomp!.downcase!
        next if line !~ /^[a-z]+$/ # Letters only

        # Create canonical version of the dict word
        line_key = line.split("").sort.join

        # Check for word lengths allowed
        if @_word_lengths_allowed.size > 0
          next unless @_word_lengths_allowed[line_key.length]
        end

        # Check for word lengths not allowed
        #if @word_lengths_not_allowed.size > 0
        #  next unless @word_lengths_not_allowed[line_key.length]
        #end

        # good word - keep the canonical version
        # FIXME - eliminate temp_array (see perl)
        temp_array = []
        unless words[line_key].nil?
          temp_array = words[line_key]
        end
        temp_array << line
        words[line_key] = temp_array
      end
    end

    # Get words that only "unjumble" one way
    unique_words = []
    words.each do |key, value|
      if words[key].length == 1
       unique_words << value
      end
    end
    unique_words.sort!

    # Get random words for jumble
    # FIXME - unique
    jumble_words = []
    1.upto(@num_words) do
      # FIXME - perl below
      #redo if $el =~ /(\w)\1+/;  # No words like ii, ooo or aaa
      jumble_words << unique_words[rand(unique_words.size)]
    end

    # Scramble the words
    jumbled_words = []
    jumble_words.each do |w|
      jumbled_words << self.jumble_word(w[0]) 
    end

    # FIXME - return jumbled_words, jumble_words (answers)
    jumbled_words
  end

  def word_lengths_allowed(*args)
    args.each do |a|
      @_word_lengths_allowed[a] = 1
    end
  end

  def word_lengths_not_allowed(*args)
    args.each do |a|
      @_word_lengths_not_allowed[a] = 1
    end
  end
end
