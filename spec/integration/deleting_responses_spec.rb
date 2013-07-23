require 'spec_helper'

feature 'Deleting responses' do
  let!(:session) { Factory(:session) }
  let!(:response) { Factory(:response, session: session) }

  before do
    visit '/'
    click_link session.question
    click_link response.answer
  end

  scenario "Deleting a response" do
    click_link "Delete Response"
    page.should have_content("Response has been deleted.")
    page.current_url.should == session_url(session)
  end
end
