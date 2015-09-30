require_relative '../rails_helper'

describe "the login/logout process", :type => :feature do
  before :each do
   create(:user)
   log_me_in
  end

  let(:user) { attributes_for(:user) }

  let(:log_me_in) {
    visit '/sessions/new'
    within("#session") do
      fill_in 'Username', :with => user[:username]
      fill_in 'Password', :with => user[:password]
    end
    click_button 'Sign in'
  }

  it "logs me in" do
    expect(page).to have_content 'Log out'
  end

  it "greets user with welcome message" do
    expect(page).to have_content "Welcome #{user[:username]}"
  end

  it "logs me out" do
    click_link "Log out"
    expect(page).to have_content "Sign Up"
  end
end

describe "fail login process", :type => :feature do

  it "throws error when login unsuccessful" do
    visit'/sessions/new'
    within("#session") do
      fill_in 'Username', :with => 'name'
      fill_in 'Password', :with => 'test'
    end
    click_button 'Sign in'
    expect(page).to have_content "Incorrect username or password"
  end
end
