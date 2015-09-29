require_relative '../rails_helper'

describe "the sign up process", :type => :feature do
  before :each do
   create(:user)
  end

  let(:user) { attributes_for(:user)}

 it "signs me up" do
  visit '/users/new'
  within("#register") do
    fill_in 'Username', :with => user[:username]
    fill_in 'Password', :with => user[:password]
  end
    click_button 'Sign up'
    expect(page).to have_content 'Log out'
  end
end
