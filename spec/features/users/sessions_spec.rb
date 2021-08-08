require 'rails_helper'

RSpec.describe "Login Page" do
  describe 'logging in' do
    before :each do
      @user_1 = User.create!(email: 'empanada_luvr@gmail.com', password: 'hocuspocus', first_name: 'Jo', last_name: 'Schmo')
      visit root_path
    end

    it 'it allows registered users to log in with correct credentials' do
      click_link 'Log me in!'

      fill_in :email, with: @user_1.email
      fill_in :password, with: @user_1.password

      click_button('Log In')

      expect(current_path).to eq(dashboard_path)
      # expect(page).to have_content('Welcome back, empanada_luvr@email.com')
      # expect(page).to_not have_content("I already have an account")
      # expect(page).to_not have_link("Log me in!")
      # expect(page).to_not have_link("Register")
      # expect(page).to have_link("Log Out")

      click_link("Log Out")

      expect(current_path).to eq(root_path)
      expect(page).to_not have_link("Log Out")
      expect(page).to have_content("I already have an account.")
      expect(page).to have_link("Register")
    end
  end
