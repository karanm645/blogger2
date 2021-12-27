require 'rails_helper' 

RSpec.describe "Article Show Page" do 
  before :each do 
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end 

  describe "they link from the articles index" do 
    it "displays info for one article" do 
      visit articles_path 
      click_link @article_1.title

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
    end 
  end 

  describe "user can delete article" do 
    it "they link from the show page" do 
      visit article_path(@article_1)
      click_link "Delete"

      expect(page).to have_content("The Article has been deleted")
      expect(current_path).to eq(articles_path)
      expect(page).to have_content(@article_2.title)
      expect(page).to_not have_content(@article_1.title)
    end 
  end 
end 