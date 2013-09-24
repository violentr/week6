require 'spec_helper'



feature "User adds a new link" do
	scenario "When browsing the home page" do
		expect(Link.count).to eq(0)
		visit("/")
		add_link("google.co.uk","Google")
		expect(Link.count).to eq(1)
		link =Link.first
		expect(link.url).to eq('http://google.co.uk')
		expect(link.title).to eq("Google")
	end
end

def add_link(url,title)
      within('#new-link') do
          fill_in 'url', :with => url
          fill_in 'title', :with => title
          click_button 'Add link'
       end
end