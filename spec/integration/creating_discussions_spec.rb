require 'spec_helper'

feature 'Creating Discussions' do
  before do
    user = Factory(:user, email: "qanda@example.com")
    user.confirm!

    visit '/'
    click_link 'New Discussion'
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", with: "qanda@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    within("h2") { page.should have_content("New Discussion") }
  end

  scenario "can create a discussion" do
    fill_in 'Question', with: 'What is the meaning of life?'
    click_button 'Create Discussion'
    page.should have_content('Discussion has been created.')
    within("#author") do
      page.should have_content("Created by qanda@example.com")
    end

    discussion = Discussion.find_by_question("What is the meaning of life?")
    page.current_url.should == discussion_url(discussion)
    title = "What is the meaning of life? - Discussions - Q&A"
    find("title").should have_content(title)
  end

  scenario "can not create a discussion without a question" do
    click_button 'Create Discussion'
    page.should have_content("Discussion has not been created.")
    page.should have_content("Question can't be blank")
  end
end
