require 'rails_helper'

RSpec.feature 'Signup users' do
  before do
    @user = User.create(email: 'example@gamil.com',
                        password: 'asdfasdf')
  end

  scenario 'with valid credentials' do
    User.delete_all
    visit '/'
    click_link 'Sign up'

    fill_in "Email", with: "#{@user.email}"
    fill_in "Password", with: "#{@user.password}"
    fill_in "Password confirmation", with: "#{@user.password}"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'without valid credentials' do
    visit '/'
    click_link 'Sign up'

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_link 'Sign up'

    #expect(page).to have_content('You have not signed up successfully')
  end
end
