require 'rails_helper'

RSpec.describe Kid, type: :model do
  describe 'relationships' do
   it { should belong_to(:user) }
   it { should have_many(:images) }
 end
end
