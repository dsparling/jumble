Feature: jumble a word

  In order to jumble a word
  As a user of the Jumble gem
  I want to pass a word to be jumbled and get a jumbled word in return

  Scenario: jumble a word
    Given a word to jumble
    When I give it a word to jumble
    Then I should see a jumbled word


