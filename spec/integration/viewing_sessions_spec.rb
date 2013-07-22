require 'spec_helper'

feature "Viewing sessions" do
  scenario "Listing all sessions" do
    session = Factory.create(:session, question: "What is the meaning of life?")
    visit '/'
    click_link 'What is the meaning of life?'
    page.current_url.should == session_url(session)
  end
end
