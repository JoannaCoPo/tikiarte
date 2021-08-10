require 'rails_helper'

RSpec.describe "Login Page" do
  describe 'logging in' do
    before :each do
      @user_1 = User.create!(email: 'empanada_luvr@gmail.com', password: 'hocuspocus', first_name: 'Jo', last_name: 'Schmo')
      visit root_path
    end

    describe 'form,' do
      it 'has email and password fields' do

        expect(page).to have_link('Log me in!')

        click_link 'Log me in!'

        expect(current_path).to eq(login_path)
        expect(page).to have_field('Email')
        expect(page).to have_field('Password')
      end

      context 'valid login,' do
        it 'it allows registered users to log in with correct credentials' do
          click_link 'Log me in!'

          expect(current_path).to eq(login_path)

          fill_in :email, with: @user_1.email
          fill_in :password, with: @user_1.password
          click_button('Log In')

          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content("Welcome back, #{@user_1.first_name}!")
        end
      end

      context 'invalid login,' do
        it 'does not allow users to log in with invlaid credentials' do
          incorrect_password = 'hocuslocus'

          click_link 'Log me in!'

          expect(current_path).to eq(login_path)

          fill_in :email, with: @user_1.email
          fill_in :password, with: incorrect_password
          save_and_open_page
          click_button('Log In')

          expect(current_path).to eq(login_path)
          expect(page).to have_content("Your username or password are incorrect")
        end
      end
    end
  end
end
