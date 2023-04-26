require "rails_helper"

#TODO Add tests for rest of attributes
describe "Game Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating game" do
      game = Game.new(title: "Test title")
      expect(game.valid?).to eq(false)
    end
    it "ensures the platform is present when creating game" do
      game = Game.new(platform: "Test platform")
      expect(game.valid?).to eq(false)
    end
    it "ensures the genre is present when creating game" do
      game = Game.new(genre: "Test genre")
      expect(game.valid?).to eq(false)
    end
    it "ensures the year is present when creating game" do
      game = Game.new(releaseDate: 2000)
      expect(game.valid?).to eq(false)
    end
    it "ensures the description is present when creating game" do
        game = Game.new(description: "Content of the description")
        expect(game.valid?).to eq(false)
    end
    it "should not be able to save game when title missing" do
      game = Game.new(title: "Test Title Here")
      expect(game.save).to eq(false)
    end
    it "should not be able to save game when platform missing" do
      game = Game.new(platform: "Test Platform Here")
      expect(game.save).to eq(false)
    end
    it "should not be able to save game when genre missing" do
      game = Game.new(genre: "Test Genre Here")
      expect(game.save).to eq(false)
    end
    it "should not be able to save game when year missing" do
      game = Game.new(releaseDate: 2000)
      expect(game.save).to eq(false)
    end
    it "should not be able to save game when description is missing" do
        game = Game.new(description: "Some description content goes here")
        expect(game.save).to eq(false)
    end  
    it "should be able to save game when have title, platform, genre, year, and description" do
      game = Game.new(title: "Title", platform: "Platform", genre: "Genre", releaseDate: 1000,
       description: "Content of the description")
      expect(game.save).to eq(true)
    end
  end
end

describe "Game Attribute Requirements on Edit", :type => :model do
  context "Edit Game" do  
    before (:each) do
      @game = Game.create(title: "Title", platform: "Platform", genre: "Genre", releaseDate: 2000,
       description: "Content of the description")
      end
    it "ensures the title is present when editing game" do
      @game.update(:title => "New Title")
      expect(@game.title == "New Title")
    end
    it "ensures the platform is present when editing game" do
      @game.update(:platform => "New Platform")
      expect(@game.platform == "New Platform")
    end
    it "ensures the genre is present when editing game" do
      @game.update(:genre => "New Genre")
      expect(@game.genre == "New Genre")
    end
    it "ensures the year released is present when editing game" do
      @game.update(:releaseDate => 1000)
      expect(@game.releaseDate == 1000)
    end
    it "ensures the description is present when editing game" do
        @game.update(:description => "Description here")
        expect(@game.description == "Description here")
    end
  end
end
