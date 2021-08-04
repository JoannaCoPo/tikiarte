require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
   it { should have_many(:kids) }
   it { should have_many(:images) }
 end
end
