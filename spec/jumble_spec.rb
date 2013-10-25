require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Jumble" do

  before(:each) do
    @j = Jumble.new()
  end

  it "should solve word for solvable word" do
    good_words = @j.solve_word('rta')
    expect(good_words).to_not be_empty
  end

  it "should not solve word for non-solvable word" do
    good_words = @j.solve_word('rtartartarta')
    expect(good_words).to be_empty
  end

  it "should jumble word" do
    word = 'ruby'
    jumbled_word = @j.jumble_word(word)
    expect(jumbled_word).not_to eq(word)
  end

  it "should create jumble" do
    @j.word_lengths_allowed(3,4) 
    jumble = @j.create_jumble
    #jumble.length.should == @j.num_words
    expect(jumble.length).to eq(@j.num_words)
  end
end
