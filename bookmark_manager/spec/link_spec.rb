require 'spec_helper'

require 'link'


describe Link do
	context "Demonstration of how datamapper works" do
		it 'should be created and then retrieved from the db' do
			expect(Link.count).to eq(0)
			#should create a link in the db and it is stored on disk
			Link.create(:title =>"MakersAcademy",
						:url =>"http://www.makersacademy.com")
			expect(Link.count).to eq(1)
			#let's  get the first link from db
			link = Link.first
			#now it has all properties that it was saved with.
			expect(link.url).to eq("http://www.makersacademy.com")
			expect(link.title).to eq("MakersAcademy")
			#if we want we can destroy it.
			link.destroy
			#so now we have no links in the DB
			expect(Link.count).to eq(0)
		end
	end
end
