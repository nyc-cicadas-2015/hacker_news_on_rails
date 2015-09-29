require_relative '../rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.create(:username => 'user@example.com', :password => 'password')
  end

  let(:user) {User.find_by(username: 'user@example.com')}

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Username', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Log out'
  end
end
