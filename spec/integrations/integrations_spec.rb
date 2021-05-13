require 'rails_helper'

feature 'User Sign In' do
  scenario 'Succes Log In' do
    u1 = User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com')
    visit new_user_session_path
    fill_in 'user[email]', with: u1.email
    fill_in 'user[password]', with: u1.password
    click_button 'commit'
    expect(page).to have_text 'Hey'
  end
end
feature 'User Create a new personal activity' do
  scenario 'Create a new personal activity' do
    u1 = User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com')
    visit new_user_session_path
    fill_in 'user[email]', with: u1.email
    fill_in 'user[password]', with: u1.password
    click_button 'commit'
    click_link 'Personal activities'
    click_link 'Add new personal activity'
    fill_in 'activity[name]', with: 'New Activity'
    fill_in 'activity[description]', with: 'New Activity from Test User'
    fill_in 'activity[schedule_date]', with: Time.now
    click_button 'commit'
    expect(page).to have_text 'New Activity from Test User'
  end
end
feature 'User Create a new group' do
  scenario 'Create a new group' do
    u1 = User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com')
    visit new_user_session_path
    fill_in 'user[email]', with: u1.email
    fill_in 'user[password]', with: u1.password
    click_button 'commit'
    click_link 'All groups'
    click_link 'Create new group'
    fill_in 'group[name]', with: 'New Group'
    fill_in 'group[icon]', with: 'New Icon For Group'
    click_button 'commit'
    expect(page).to have_text 'New Group'
  end
end
feature 'User Create a new group activity' do
  scenario 'Create a new group activity' do
    u1 = User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com')
    visit new_user_session_path
    fill_in 'user[email]', with: u1.email
    fill_in 'user[password]', with: u1.password
    click_button 'commit'
    click_link 'All groups'
    click_link 'Create new group'
    fill_in 'group[name]', with: 'Next Group'
    fill_in 'group[icon]', with: 'New Icon For Group'
    click_button 'commit'
    click_link 'Next Group'
    click_link 'Add new external activity'
    fill_in 'activity[name]', with: 'Group Activity'
    fill_in 'activity[description]', with: 'New Group Activity from Test User'
    fill_in 'activity[schedule_date]', with: Time.now
    click_button 'commit'
    expect(page).to have_text 'New Group Activity from Test User'
  end
end
feature 'User Create a new participation' do
  scenario 'Create a new participation' do
    u1 = User.create!(username: 'Ilie', password: '123456', email: 'mail@mail.com')
    u2 = User.create!(username: 'User1', password: '123456', email: 'user1@mail.com')
    visit new_user_session_path
    fill_in 'user[email]', with: u1.email
    fill_in 'user[password]', with: u1.password
    click_button 'commit'
    click_link 'All groups'
    click_link 'Create new group'
    fill_in 'group[name]', with: 'Next Group'
    fill_in 'group[icon]', with: 'New Icon For Group'
    click_button 'commit'
    click_link 'Next Group'
    click_link 'Add new external activity'
    fill_in 'activity[name]', with: 'Group Activity'
    fill_in 'activity[description]', with: 'New Group Activity from Test User'
    fill_in 'activity[schedule_date]', with: Time.now
    click_button 'commit'
    visit destroy_user_session_path
    visit new_user_session_path
    fill_in 'user[email]', with: u2.email
    fill_in 'user[password]', with: u2.password
    click_button 'commit'
    click_link 'All groups'
    click_link 'Next Group'
    click_button 'commit'
    visit activity_participations_path

    expect(page).to have_text 'New Group Activity from Test User'
  end
end
