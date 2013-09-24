require 'spec_helper'

Capybara.app = BookManager
feature "Adding tags to links" do
	scenario "with a few tags" do
		visit("/")
		add_link("http://google.co.uk","Google",['search','google'])
		link =Link.first
		expect(link.tags.map(&:text)).to include("education")
		expect(link.tags.map(&:text)).to include("ruby")
	end
end

def add_link(url, title, tags = [])    
    within('#new-link') do
      fill_in 'url', :with => url
      fill_in 'title', :with => title
      # our tags will be space separated
      fill_in 'tags', :with => tags.join(' ')
      click_button 'Add link'
    end      
  end
	