require 'rails_helper'

RSpec.describe 'Registration Page' do
  before :each do
    # @user_1 = User.create!(email: 'empanada_luvr@gmail.com', password: 'hocuspocus', first_name: 'Alexis', last_name: 'Rose')
    visit new_register_path
  end

  describe 'form,' do
    it 'has name, email, and password fields' do
      within '#register' do
        expect(page).to have_field 'user[first_name]'
        expect(page).to have_field 'user[last_name]'
        expect(page).to have_field 'user[email]'
        expect(page).to have_field 'user[password]'
        expect(page).to have_field 'user[password_confirmation]'
        expect(page).to have_button 'Register'
      end
    end

    context 'valid registration,' do
      it 'navigates new user to the dashboard' do
        within '#register' do
          fill_in 'user[first_name]', with: 'Alexis'
          fill_in 'user[last_name]', with: 'Rose'
          fill_in 'user[email]', with: 'lilbit@alexis.com'
          fill_in 'user[password]', with: 'hocuspocus'
          fill_in 'user[password_confirmation]', with: 'hocuspocus'
          click_button 'Register'
        end

        expect(current_path).to eq(user_path)

        within '#flash-message' do
          expect(page).to have_content("Welcome Alexis")
        end
      end
    end

    #edge case 1 - existing account
    context 'invalid registration with existing user,' do
      it 'stays on the registration page with a flash alert message' do
        within '#register' do
          fill_in 'user[first_name]', with: 'David'
          fill_in 'user[last_name]', with: 'Rose'
          fill_in 'user[email]', with: 'apoth@david.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button 'Register'
        end

        expect(current_path).to eq user_path

        visit new_register_path

        within '#register' do
          fill_in 'user[first_name]', with: 'David'
          fill_in 'user[last_name]', with: 'Rose'
          fill_in 'user[email]', with: 'apoth@david.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button 'Register'
        end

        expect(current_path).to eq new_register_path

        within '#flash-message' do
          expect(page).to have_content("User account not created, please try again.")
        end
      end
    end
  end
end

#need more edge case testing:
# => 'email field cannot be blank'
#   'password field cannot be blank'
#   'must be a valid email format'
#   'password and password confirmation must match'
