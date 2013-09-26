require 'spec_helper'

feature "User signs up" do
	scenario "When being logged out" do
	lambda{sign_up}.should change(User, :count).by(1)
	expect(page).to have_content("Welcome, den@example.com")
	expect(User.first.email).to eq 'den@example.com'
	end
end
