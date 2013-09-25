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
  	before(:each) {
    Link.create(:url => "http://www.makersacademy.com",
                :title => "MakersAcademy", 
                :tags => [Tag.first_or_create(:text => 'education')])
    Link.create(:url => "http://www.google.co.uk", 
                :title => "Google", 
                :tags => [Tag.first_or_create(:text => 'search')])
    Link.create(:url => "http://www.msn.com", 
                :title => "MSN", 
                :tags => [Tag.first_or_create(:text => 'microsoft')])
    }

  	scenario "filtered by tag" do
  		visit'/tags/search'
  		expect(page).not_to have_content("MakersAcademy")
  		expect(page).not_to have_content("Google")
  		expect(page).not_to have_content("MSN")
  	end
end