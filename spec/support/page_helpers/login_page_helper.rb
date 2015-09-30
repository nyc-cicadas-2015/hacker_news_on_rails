class LoginPageHelper
  include Capybara::DSL

  def visit_page
    visit '/sessions/new'
    self
  end

  def login user
    within("#session") do
      fill_in 'Username', :with => user[:username]
      fill_in 'Password', :with => user[:password]
    end
    click_button 'Sign in'
    self
  end

end

