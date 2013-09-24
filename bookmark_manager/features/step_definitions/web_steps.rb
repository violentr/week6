#No web links on a website
Given(/^I visit home page$/) do
 visit("/")
 end

Then(/^I should see "(.*?)"$/) do |message|
  page.should have_content message
end

Then(/^there are no links to display$/) do
  expect(page.has_xpath?('//section/ul')).to be_true
  expect(page.has_xpath?('//section/ul/li')).to be_false
end

#a link was added to a website
Given(/^I have no links on the web page$/) do
 
end

Then(/^A weblink is added to the website$/) do
 end

Then(/^there should be one web link$/) do
  pending # express the regexp above with the code you wish you had
end
