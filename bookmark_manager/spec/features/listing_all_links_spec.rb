require 'spec_helper'
require 'link'

Capybara.app = BookManager #must be declared your App.

feature "User browses the list of links" do
	before(:each) {
		Link.create(:url =>"http://makersacademy.com")
	}	
	scenario "when opening the home page" do
    	visit "/"
    	expect(page).to have_content("MakersAcademy")
  	end
end