Given /^I have a Google API key$/ do
  Settings.google_api_key.should_not be_empty
end

When /^I do a search$/ do
  visit '/'
  fill_in 'Keywords', :with => 'vintage decor'
  click_button 'Search'
end
Then /^I should get the list of the products$/ do
  page.has_css?("table tr", :count => 25).should be_true
end