require 'rails_helper'

RSpec.describe "Show Page" do
  before :each do
    @user_1 = User.create!(email: 'empanada_luvr@gmail.com', password: 'hocuspocus', first_name: 'Jo', last_name: 'Schmo')
    @kid_1 = Kid.create!(user: @user_1, first_name: 'Scarlett', last_name: 'Cortes')
    @kid_2 = Kid.create!(user: @user_1, first_name: 'Mystery', last_name: 'Child')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    visit dashboard_path
  end

  describe 'user kids section' do
    xit 'displays kids that user has added to account' do
      within '#kids' do

        expect(page).to have_content(@kid_1.name)
        expect(page).to have_content(@kid_2.name)
      end
    end

    xit 'links to the kid artwork show page' do
      within '#kids' do
        expect(page).to have_button(@kid_1.name)
      end
    end
  end
end
