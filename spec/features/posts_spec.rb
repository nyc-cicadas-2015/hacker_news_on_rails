require_relative '../rails_helper'

describe "require login" do
  it "to create post" do
    visit "/"
    expect(page).to have_content 'Login to create new post'
  end
end

describe "create post", :type => :feature do

  let(:post) { attributes_for(:post) }
  let(:log_me_in) { LoginPageHelper.new.visit_page.login(user) }

  before :each do
    create(:user)
    log_me_in
  end

  let(:user) { attributes_for(:user) }

  it "displays new post on index" do
    visit '/posts/new'
    within("#new_post") do
      fill_in 'Title', :with => post[:title]
      fill_in 'Link', :with => post[:link]
    end
    click_button 'Submit Post'
    expect(page).to have_content post[:title]
  end

  it "does not create post with empty fields" do
    visit '/posts/new'
    within("#new_post") do
      fill_in 'Title', :with => post[:title]
    end
    click_button 'Submit Post'
    expect(page).to have_content("Create New Post")
  end

end


