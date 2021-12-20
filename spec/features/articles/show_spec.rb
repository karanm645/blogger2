require 'rails_helper' 

RSpec.describe "Article Show Page" do 
  before :each do 
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
  end 

  describe "they link from the articles index" do 
    it "displays info for one article" do 
      visit articles_path 
      click_link @article_1.title

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
    end 
  end 
end 