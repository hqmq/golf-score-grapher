When /^I go to "(.*?)"$/ do |path|
  visit path
end

Then /^I should see "(.*?)"$/ do |arg1|
  assert page.has_content?(arg1), "Page expected to contain text: #{arg1}"
end