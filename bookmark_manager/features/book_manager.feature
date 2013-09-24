Feature: Shows links

Scenario:In order to save myself no to rememmber all this crap
As user
I wnat to be able to see my links

Scenario: When there are no links
Given I visit home page
Then I should see "Welcome to Links"
And there are no links to display

Scenario: When a web link is added to the webpage 
Given I have no links on the web page
Then A weblink is added to the website
And there should be one web link
