require_relative '../rails_helper'

describe "create post", :type => :feature do

  let(:post) { attributes_for(:post) }

  it "requires login to create post" do
    visit "/"
    expect(page).to have_content 'Login to create new post'
  end

  it "displays new post on index" do
    log_me_in

end


