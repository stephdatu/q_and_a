require 'spec_helper'

feature "Seed Data" do
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
    user = User.find_by_email!("qanda@example.com")
    sign_in_as!(user)
    page.should have_content("Q&A")
  end
end
