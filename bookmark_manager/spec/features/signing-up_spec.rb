require 'spec_helper'

Capybara.app = BookManager

feature "User signs up" do
	scenario "When being logged out" do
		lambda{sign_up}.should change(User, :count).by(1)
		expect(page).to have_content("Welcome, den@example.com")
		expect(User.first.email).to eq 'den@example.com'
	end
	def sign_up(email="den@example.com",password='oranges!',password_confirmation='oranges!')
		visit '/users/new'
		# save_and_open_page
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button "Sign up"
	end
end
