When /^I go to the course detail page for "(.*?)"$/ do |arg1|
  visit "/courses/#{arg1.to_i}"
end

Then /^I should see a history of games played$/ do
  page.should have_selector(".history .games")
  page.all('.history .game').count.should == 2
  page.should have_selector(".history .statistics")
  page.find('.history .statistics .total').text.to_i.should == 2
end

Then /^I should see a calculated par for the course$/ do
  page.should have_selector(".calculated-par table")
  page.all('.calculated-par td').map{|n| n.text.to_i}.should == [2,2,3,3,3,3,3,3,3,2,2,2,3,3,3,4,3,2]
end

Then /^I should see a graph of the par for the course$/ do
  page.should have_selector(".calculated-par .graph")
end

Then /^I should see top (\d+) records$/ do |arg1|
  page.should have_selector(".records")
  page.all('.records .record').count.should == arg1.to_i
end