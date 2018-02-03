require 'rails_helper'

RSpec.feature 'Delete article' do

  before do
    @article = Article.create(title: "First article", body: "This is a first article")
  end

  scenario 'user successfully deletes an article' do
    visit '/'
    click_link @article.title
    click_link 'Delete'

    expect(page).to have_content('Article has been deleted')
    expect(page.current_path).to eq(articles_path)
  end

end
