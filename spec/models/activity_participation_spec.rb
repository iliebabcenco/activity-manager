require 'rails_helper'

RSpec.describe ActivityParticipation, type: :model do
  context 'correctly associates between a user and activities as a participator and creator' do
    let(:user) { User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com') }
    let(:sr) { User.create!(username: 'Stranger', password: '123456', email: 'stranger@mail.com') }

    it 'check all types of participations' do
      gr = user.groups.build(name: 'lalala', icon: 'icon')
      user.create_external_activity(name: 'New Group Activity', description: 'New Description',
                                    schedule_date: Time.now, group_id: gr.id)
      user.create_personal_activity(name: 'New Personal', description: 'New Description', schedule_date: Time.now)
      sga = sr.create_external_activity(name: "Stranger's Activity",
                                        description: 'New Description', schedule_date: Time.now, group_id: gr.id)
      ActivityParticipation.create!(participant_id: user.id, activity_id: sga.id)
      expect(user.all_participations.size).to eq 3
    end
  end
end
