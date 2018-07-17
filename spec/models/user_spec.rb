require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#add_role' do
    it 'adds a new role' do
      user = User.create
      user.add_role('student')
      expect(user.roles.count).to eq(1)
    end
    it 'does not add already existing role' do
      user = User.create
      user.add_role('student')
      user.add_role('student')
      expect(user.roles.count).to eq(1)
    end

    it 'does not existing role' do
      user = User.create
      user.add_role('choosen')
      expect(user.roles.count).to eq(0)
    end
  end

  describe '#remove_role' do
    context 'role exists for user' do
      it 'removes existing role' do
        user = User.create
        user.add_role('student')
        user.remove_role('student')
        expect(user.roles.count).to eq(0)
      end
    end
    context 'role does not exist for user' do
      it 'does nothing' do
        user = User.create
        user.remove_role('student')
        expect(user.roles.count).to eq(0)
      end
    end
  end
  
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
