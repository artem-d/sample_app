# def full_title(page_title)
#   base_title = "Ruby on Rails Tutorial Sample App"
#   if page_title.empty?
#     base_title
#   else
#     "#{base_title} | #{page_title}"
#   end
# end   

include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in 'Email',    with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def edit_user(user, name, email)
  visit edit_user_path(user)
  fill_in 'Name',             with: name
  fill_in 'Email',            with: email
  fill_in 'Password',         with: user.password
  fill_in 'Confirm Password', with: user.password
  click_button 'Save changes'
end


def valid_signup
  visit signup_path
  fill_in 'Name',             with: 'Example User'
  fill_in 'Email',            with: 'user@example.com'
  fill_in 'Password',         with: 'foobar'
  fill_in 'Confirm Password', with: 'foobar'
  click_button submit
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end