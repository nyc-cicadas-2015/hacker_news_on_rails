require_relative '../rails_helper'

describe "the sign up process", :type => :feature do


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

  it "throws error if username already taken" do
    existing_user = create(:user)
    visit '/users/new'
      within("#register") do
        fill_in 'Username', :with => existing_user[:username]
        fill_in 'Password', :with => existing_user[:password]
    end
    click_button 'Sign up'
    expect(page).to have_content 'Sign Up'
  end
end
