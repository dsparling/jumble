Given /^a word to jumble$/ do
  @jumble = Jumble.new
  @word = 'ruby'
end

When /^I give it a word to jumble$/ do
  @jumbled_word = @jumble.jumble_word('ruby')
end

Then /^I should see a jumbled word$/ do
  @jumbled_word.chars.sort.join == @word.chars.sort.join
end
