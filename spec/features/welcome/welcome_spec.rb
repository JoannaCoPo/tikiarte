require 'rails_helper'

RSpec.describe "Welcome Page" do
  describe "Weclome Page and Log In via root path" do
    before :each do
      visit root_path
    end

    it 'displays a welcome message and app description to the user' do
      within '#welcome'do
        welcome_message = "Welcome to tikiarte, a safe platform to showcase artwork created by kids. MORE DETAILS"
        description = "EXPLAIN HOW IT WORKS"

        expect(page).to have_content(welcome_message)
        expect(page).to have_content(description)
      end
    end

    it 'lists steps to be able to upload images of artwork' do
      within("#list") do
        expect(page).to have_content("You, The Adult, creates an account.")
        expect(page).to have_content("Start uploaded images of artwork to showcase!")
      end
    end
  end
end
