require 'rails_helper'

RSpec.describe "user creates a new article" do 
  describe "they'll link from the articles index" do 
    describe "they fill in a title and body" do 
      it 'creates a new article' do 
        visit articles_path
        click_link "Create New Article"

        expect(current_path).to eq(new_article_path)

        fill_in :title, with: "New Title!"
        fill_in :body, with: "New Body!"
        click_on "Create Article"

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
      end 
    end 
  end 
end