require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#add_role' do
    it 'adds a new role' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      expect(user.roles.count).to eq(1)
    end
    it 'does not add already existing role' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      user.add_role('student')
      expect(user.roles.count).to eq(1)
    end

    it 'does not add not vaild role' do
      user = FactoryBot.create(:user)
      user.add_role('choosen')
      expect(user.roles.count).to eq(0)
    end
  end

  describe '#remove_role' do
    context 'role exists for user' do
      it 'removes existing role' do
        user = FactoryBot.create(:user)
        user.add_role('student')
        user.remove_role('student')
        expect(user.roles.count).to eq(0)
      end
    end
    context 'role does not exist for user' do
      it 'does nothing' do
        user = FactoryBot.create(:user)
        user.remove_role('student')
        expect(user.roles.count).to eq(0)
      end
    end
  end

  describe '#student?' do
    context 'when has student role' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      it 'returns true' do
        expect(user.student?).to eq(true)
      end
    end
    context 'when has no student role' do
      user = FactoryBot.create(:user)
      it 'returns false' do
        expect(user.student?).to eq(false)
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
