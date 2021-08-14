require 'rails_helper'

RSpec.describe "Show Page" do
  before :each do
    @user_1 = User.create!(email: 'empanada_luvr@gmail.com', password: 'hocuspocus', first_name: 'Jo', last_name: 'Schmo')
    @kid_1 = Kid.create!(user: @user_1, first_name: 'Scarlett', last_name: 'Cortes')
    @kid_2 = Kid.create!(user: @user_1, first_name: 'Mystery', last_name: 'Child')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    visit user_path
  end

  describe 'user kids section' do
    it 'displays kids that user have been added to account' do
      within '#kids' do
        expect(page).to have_content(@kid_1.first_name)
        expect(page).to have_content(@kid_2.first_name)
      end
    end

    it 'links to the kid artwork show page' do
      within '#kids' do
        expect(page).to have_button(@kid_1.first_name)

        click_button(@kid_1.first_name)

        expect(current_path).to eq(user_kid_path(@kid_1.id))
      end
    end

    it 'has link to add another kid to user account' do
      within '#kids' do
        expect(page).to have_button('Add another kid')
        click_button('Add another kid')
        expect(current_path).to eq(new_user_kid_path)
      end
    end

    it 'indicates when no kids have been added yet' do
      @user_2 = User.create!(email: 'test@gmail.com', password: 'test', first_name: 'Test', last_name: 'Tester')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
      visit user_path

      within '#kids' do
        expect(page).to have_content("You haven't added any kids to your account yet.")
        expect(page).to have_button('Add kid')

        click_button('Add kid')
        expect(current_path).to eq(new_user_kid_path)
      end
    end
  end
end
