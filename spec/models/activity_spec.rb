require 'rails_helper'

RSpec.describe Activity, type: :model do
  context 'correctly associates between a user and activities as a creator, and groups' do
    let(:user) { User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com') }
    it 'check all types activities' do
      gr = user.groups.create!(name: 'lalala', icon: 'icon.jpg')
      user.create_external_activity(name: 'Group Activity', description: 'New Description', schedule_date: Time.now,
                                    group_id: gr.id)
      user.create_personal_activity(name: 'Personal', description: 'New Description', schedule_date: Time.now)
      expect(user.all_participations.size).to eq 2
    end
    it 'check associations between a group and a group activity' do
      gr = user.groups.create!(name: 'lalala2', icon: 'icon.jpg')
      act = user.create_external_activity(name: 'Group Activity', description: 'New Description',
                                          schedule_date: Time.now, group_id: gr.id)
      expect(act.group.id).to eq gr.id
    end
    it 'check associations between a group and a non group activity' do
      user.groups.create!(name: 'lalala2', icon: 'icon.jpg')
      act = user.create_personal_activity(name: 'Personal', description: 'New Description', schedule_date: Time.now)
      expect(act.group).to eq nil
    end
    it 'create a group activity with a wrong length of the title' do
      gr = user.groups.create(name: 'new group', icon: 'icon.jpg')
      act = user.create_external_activity(name: 'G', description: 'New Description', schedule_date: Time.now,
                                          group_id: gr.id)
      expect(act.valid?).to be false
    end
    it 'create a personal activity with a wrong length of the title' do
      user.groups.create(name: 'new group', icon: 'icon.jpg')
      act = user.create_personal_activity(name: 'P', description: 'New Description', schedule_date: Time.now)
      expect(act.valid?).to be false
    end
  end
end
