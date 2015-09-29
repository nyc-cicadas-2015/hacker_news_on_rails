require_relative '../rails_helper'

describe "the login/logout process", :type => :feature do
  before :each do
   create(:user)
   puts user
  end

  let(:user) { attributes_for(:user)}

  it "logs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Username', :with => user[:username]
      fill_in 'Password', :with => user[:password]
    end
    click_button 'Sign in'
    expect(page).to have_content 'Log out'
  end

  it "logs me out" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Username', :with => user[:username]
      fill_in 'Password', :with => user[:password]
    end
    click_button 'Sign in'
    click_link "Log out"
    expect(page).to have_content "Sign Up"
  end

end
