require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'correctly associates between a user and activities and groups' do
    let(:user) { User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com') }

    it 'check group creation by an user' do
      user.groups.create!(name: 'lalala', icon: 'icon.jpg')
      expect(user.groups.size).to eq 1
    end
    it 'check creator field for a group' do
      gr = user.groups.create!(name: 'lalala', icon: 'icon.jpg')
      expect(gr.creator.id).to eq user.id
    end
    it 'check a group activities' do
      gr = user.groups.create!(name: 'lalala2', icon: 'icon.jpg')
      user.create_external_activity(name: 'Group Activity', description: 'New Description', schedule_date: Time.now,
                                    group_id: gr.id)
      user.create_external_activity(name: 'Group Activity2', description: 'New Description2', schedule_date: Time.now,
                                    group_id: gr.id)
      expect(gr.activities.size).to eq 2
    end
    it 'create a group with a wrong length of the title' do
      gr = user.groups.create(name: 'l', icon: 'icon.jpg')
      expect(gr.valid?).to be false
    end
  end
end
