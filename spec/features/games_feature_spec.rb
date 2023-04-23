require "rails_helper"

#TODO Update for attributes
RSpec.feature "Games", type: :feature do
    context "Update game" do
      let(:game) { Game.create(title: "Test title", description: "Test content") }
      before(:each) do
        visit edit_game_path(game)
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Title", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Title can't be blank")
      end

    end
end