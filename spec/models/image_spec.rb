require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'relationships' do
   it { should belong_to(:user) }
   it { should belong_to(:kid) }
 end
end
