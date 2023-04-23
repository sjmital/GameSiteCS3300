require "rails_helper"

#TODO Add tests for rest of attributes
describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating project" do
      game = Game.new(description: "Content of the description")
      expect(game.valid?).to eq(false)
    end
    it "ensures the description is present when creating project" do
        game = Game.new(description: "Content of the description")
        expect(game.valid?).to eq(false)
    end
    it "should not be able to save project when title missing" do
      game = Game.new(description: "Some description content goes here")
      expect(game.save).to eq(false)
    end
    it "should not be able to save project when description is missing" do
        game = Game.new(description: "Some description content goes here")
        expect(game.save).to eq(false)
    end  
    it "should be able to save project when have description and title" do
      game = Game.new(title: "Title", description: "Content of the description")
      expect(game.save).to eq(true)
    end
  end
end

describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @game = Game.create(title: "Title", description: "Content of the description")
 
      end
    it "ensures the title is present when editing project" do
      @game.update(:title => "New Title")
      expect(@game.title == "New Title")
    end
    it "ensures the description is present when editing project" do
        @game.update(:description => "Description here")
        expect(@game.description == "Description here")
    end
  end
end
