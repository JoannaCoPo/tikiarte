require 'rails_helper'

RSpec.describe "Login Page" do
  describe 'logging in' do
    before :each do
      @user_1 = User.create!(email: 'empanada_luvr@gmail.com', password: 'hocuspocus', first_name: 'Jo', last_name: 'Schmo')
      visit root_path
    end

    it 'it allows registered users to log in with correct credentials' do
      click_link 'Log me in!'

      expect(current_path).to eq(new_login_path)

      fill_in :email, with: @user_1.email
      fill_in :password, with: @user_1.password

      click_button('Log In')

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome back, #{@user_1.first_name}!")
    end
  end
end
