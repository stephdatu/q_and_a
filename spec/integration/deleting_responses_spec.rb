require 'spec_helper'

feature 'Deleting responses' do
  let!(:discussion) { Factory(:discussion) }
  let!(:response) { Factory(:response, discussion: discussion) }

  before do
    visit '/'
    click_link discussion.question
    click_link response.answer
  end

  scenario "Deleting a response" do
    click_link "Delete Response"
    page.should have_content("Response has been deleted.")
    page.current_url.should == discussion_url(discussion)
  end
end
