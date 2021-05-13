require 'rails_helper'

RSpec.describe ActivityParticipation, type: :model do
  context 'correctly associates between a user and activities as a participator and creator' do
    let(:user) { User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com') }
    let(:stranger) { User.create!(username: 'Stranger', password: '123456', email: 'stranger@mail.com') }

    it 'check all types of participations' do
      gr = user.groups.build(name: "lalala", icon: "icon")
      user.create_external_activity(name: "New Group Activity", description: "New Description", schedule_date: Time.now, group_id: gr.id)
      user.create_personal_activity(name: "New Personal", description: "New Description", schedule_date: Time.now)
      stranger_group_activity = stranger.create_external_activity(name: "Stranger's Activity", description: "New Description", schedule_date: Time.now, group_id: gr.id)
      ActivityParticipation.create!(participant_id: user.id, activity_id: stranger_group_activity.id)
      expect(user.all_participations.size).to eq 3
    end
  end
end
