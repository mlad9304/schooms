require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#full_name' do
    it 'returns full name of user' do
      user = User.new(
        first_name: 'Chris',
        last_name: 'Perez'
      )
      expect(user.full_name).to eq('Chris Perez') 
    end
  end
end
