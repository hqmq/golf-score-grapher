When /^I go to the home page$/ do
  visit '/'
end

Then /^I should see "(.*?)"$/ do |arg1|
  assert page.has_content?(arg1), "Page expected to contain text: #{arg1}"
end

Then /^I should see a list of games in order of recency$/ do
  assert page.all('.games .game').size == Game.count, "expected there to be .games .game elements for each game"
  assert Game.count > 0, "Expected there to be games seeded in the db"
end