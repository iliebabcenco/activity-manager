require 'rails_helper'

RSpec.describe User, type: :model do
  context 'correctly validations for users' do
    let(:user) { User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com') }

    it 'check a correct username length' do
      expect(user.valid?).to be true
    end
    it 'check an incorrect username length' do
      user = User.create(username: 'I', password: '123456', email: 'mail@mail.com')
      expect(user.valid?).to be false
    end
    it 'check creation with the same username' do
      User.create(username: 'Ilie', password: '123456', email: 'mail@mail.com')
      user2 = User.create(username: 'Ilie', password: '123456', email: 'mail2@mail.com')
      expect(user2.valid?).to be false
    end
    it 'check creation with the same username' do
      User.create(username: 'Ilie', password: '123456', email: 'mail@mail.com')
      user2 = User.create(username: 'Ilie2', password: '123456', email: 'mail@mail.com')
      expect(user2.valid?).to be false
    end
    it 'check a correct password length' do
      user = User.create(username: 'Ilie', password: '123456', email: 'mail@mail.com')
      expect(user.valid?).to be true
    end
    it 'check a incorrect password length' do
      user = User.create(username: 'Ilie', password: '1', email: 'mail@mail.com')
      expect(user.valid?).to be false
    end
    it 'check a incorrect email length' do
      user = User.create(username: 'Ilie', password: '123456', email: '@')
      expect(user.valid?).to be false
    end
  end
end
