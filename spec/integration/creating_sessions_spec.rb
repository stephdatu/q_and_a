require 'spec_helper'

feature 'Creating Sessions' do
  scenario "can create a session" do
    visit '/'
    click_link 'New Session'
    fill_in 'Question', with: 'What is the meaning of life?'
    click_button 'Create Session'
    page.should have_content('Session has been created.')
  end
end
