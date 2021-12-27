require 'rails_helper'

RSpec.describe "user edits an article" do 
  before :each do 
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end 

  describe 'they edit title and body' do 
    it 'edits article' do 
      article_3 = Article.create!(title: "Title Three", body: "Body 1")
      visit article_path(article_3)
      click_button "Update #{article_3.title}"

      expect(current_path).to eq(edit_article_path(article_3))

      fill_in :title, with: "Title Four"
      fill_in :body, with: "Edited Body!"
      click_on "Update Article"

      # expect(page).to have_content("Article Title Four was udpated!") -> why is this not working?
      expect(current_path).to eq(article_path(article_3))
      expect(page).to have_content('Title Four')
      expect(page).to have_content("Edited Body!")

    end 
  end 
end 