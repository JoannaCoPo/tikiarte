require 'rails_helper'

RSpec.describe 'Add new kid to account' do
  before :each do
    @user_1 = User.create!(email: 'empanada_luvr@gmail.com', password: 'hocuspocus', first_name: 'Jo', last_name: 'Schmo')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    visit new_user_kid_path
  end

  describe 'form,' do
    it 'has require first and last name fields' do
      within '#new' do
        expect(page).to have_field('kid[first_name]')
        expect(page).to have_field('kid[last_name]')
        #assertion for required fields
      end
    end

    it 'has optional fields for additional information' do
      within '#new' do
        expect(page).to have_field('kid[age]')
        expect(page).to have_field('kid[location]')
        #assertion for not required fields
      end
    end

    context 'valid kid addition,' do
      it 'navigates to kid show page' do
        within '#new' do
          fill_in 'kid[first_name]', with: 'Scarlett'
          fill_in 'kid[last_name]', with: 'Cortes'

          click_button 'Add Kiddo'
        end

        expect(current_path).to eq(user_path)

        within '#flash-message' do
          expect(page).to have_content("Scarlett has been added to your account!")
        end
      end
    end
  end
end

# ADD EDGE CASES FOR INVALID ADDITION
