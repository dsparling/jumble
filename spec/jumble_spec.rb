require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Jumble" do

  before(:each) do
    @j = Jumble.new()
    @j.num_words = 5
  end

  describe "Solve Word" do

    context "Solvable word" do
      it "returns array of solution words" do
        good_words = @j.solve_word('rta')
        expect(good_words).to be_kind_of(Array)
        expect(good_words).to_not be_empty
      end
    end

    context "Non-solvable word" do
      it "returns empty array" do
        good_words = @j.solve_word('rtartartarta')
        expect(good_words).to be_kind_of(Array)
        expect(good_words).to be_empty
      end
    end
  end

  describe "Jumble Word" do
    it "returns a string containing the jumbled word" do
      word = 'ruby'
      jumbled_word = @j.jumble_word(word)
      expect(jumbled_word).to be_kind_of(String)
      expect(jumbled_word).not_to be_empty
      expect(jumbled_word).not_to eq(word)
    end
  end

  describe "Create Jumble" do
    it "returns array of jumbled words" do
      jumble = @j.create_jumble
      expect(jumble).to be_kind_of(Array)
      expect(jumble).not_to be_empty
    end

    it "returns requested number of jumbled words" do
      jumble = @j.create_jumble
      expect(jumble.length).to eq(@j.num_words)
    end

    it "returns array of jumbled words only of allowed length" do
      @j.word_lengths_allowed(3,4)
      jumble = @j.create_jumble
      expect(jumble.select{ |x| x.length < 3 && x.length > 4 }).to be_empty
    end

    it "returns array of jumbled words, none of disallowed length " do
      @j.word_lengths_not_allowed(3)
      jumble = @j.create_jumble
      expect(jumble.select{ |x| x.length == 3 }).to be_empty
    end
  end
end
