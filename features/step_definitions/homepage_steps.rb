When /^I go to the home page$/ do
  visit '/'
end

Then /^I should see a list of games in order of recency$/ do
  page.all('.games .game').size.should == 3
  page.all('.games .game .played_at').map{|element| element.text}.should == [""]
end