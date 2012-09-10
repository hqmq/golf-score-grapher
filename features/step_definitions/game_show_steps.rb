Then /^I should see a table of data for game(\d+)$/ do |arg1|
  page.all(".table-of-scores").size.should == 1
  page.all('.table-of-scores tr td').size.should == 100
end

Then /^I should see a graph of data for game(\d+)$/ do |arg1|
  page.should have_content("chart.draw")
end