require_relative '../rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    create(:user)
  end

  let(:user) { attributes_for(:user)}

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Username', :with => user[:username]
      fill_in 'Password', :with => user[:password]
    end
    click_button 'Sign in'
    expect(page).to have_content 'Log out'
  end
end
