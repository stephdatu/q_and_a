require 'spec_helper'

feature 'Creating Sessions' do
  before do
    visit '/'
    click_link 'New Session'
  end

  scenario "can create a session" do
    fill_in 'Question', with: 'What is the meaning of life?'
    click_button 'Create Session'
    page.should have_content('Session has been created.')

    session = Session.find_by_question("What is the meaning of life?")
    page.current_url.should == session_url(session)
    title = "What is the meaning of life? - Sessions - Q&A"
    find("title").should have_content(title)
  end

  scenario "can not create a session without a question" do
    click_button 'Create Session'
    page.should have_content("Session has not been created.")
    page.should have_content("Question can't be blank")
  end
end
