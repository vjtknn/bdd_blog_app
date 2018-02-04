require 'rails_helper'

RSpec.feature 'Signing out signed-in users' do

  before do
    @john = User.create!(email: 'john@email.com', password: 'password')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password
    click_button 'Log in'
  end
  
end
