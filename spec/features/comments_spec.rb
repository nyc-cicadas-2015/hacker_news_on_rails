require_relative '../rails_helper'

describe "comments", :type => :feature do
  let(:comment) { attributes_for(:comment) }

  it "does not create comment without login" do
    post = create(:post)
    visit show_post_path(post)
    within("#new_comment") do
    fill_in 'comment_body', :with => comment[:body]
    end
  click_button 'Submit comment'
  expect(page).to have_content("Login")
  end
end

