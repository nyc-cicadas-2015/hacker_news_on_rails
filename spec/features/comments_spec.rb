require_relative '../rails_helper'

describe "comments", :type => :feature do

  let(:comment) { attributes_for(:comment) }

  it "it does not create comment without login" do
    visit '/posts/1'
    within("#new_comment") do
    fill_in 'Comment', :with => comment[:body]
    end
  click_button 'Submit comment'
  expect(page).to have_content("Login")
  end
end

