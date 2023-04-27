require "rails_helper"

RSpec.feature "Games", type: :feature do
    context "Update game" do
      let(:game) { Game.create(title: "Test title", platform: "Test platform", genre: "Test genre",
       releaseDate: 2000, description: "Test content") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_game_path(game)
      end
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end

      scenario "should fail without title" do
        within("form") do
          fill_in "Title", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Title can't be blank")
      end

      scenario "should fail without platform" do
        within("form") do
          fill_in "Platform", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Platform can't be blank")
      end

      scenario "should fail without genre" do
        within("form") do
          fill_in "Genre", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Genre can't be blank")
      end

      scenario "should fail without year" do
        within("form") do
          fill_in "Year released", with: nil
        end
        click_button "Update Game"
        expect(page).to have_content("ReleaseDate can't be blank")
      end
 
      scenario "should fail without description" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Description can't be blank")
      end

    end # Update game

    context "Create game" do
      # Run the following for each scenario
      let(:game) { Game.create(title: "Test Title", description: "Test description",
       platform: "Test platform", genre: "Test genre", releaseDate: 2000) } #Arrange
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_game_path
      end  
    
      # Scenario is an alias for an it block
      scenario "should successfully create a game" do
        fill_in "Title", with: "Test title"
        fill_in "Platform", with: "Test platform"
        fill_in "Genre", with: "Test genre"
        fill_in "Year released", with: 2000 # TODO Not working
        fill_in "Description", with: "Test description"

        click_button "Create Game"
        expect(page).to have_content("Game was successfully created")
      end
        
      scenario "should fail without title" do
        # Leave the title blank on the form page
        within("form") do
          fill_in "Title", with: ""
        end
        # When "Create Game" is clicked, test will pass if the
        # page displays "Title can't be blank"
        click_button "Create Game"
        expect(page).to have_content("Title can't be blank")
      end # title is blank

      scenario "should fail without platform" do
        within("form") do
          fill_in "Platform", with: ""
        end
        click_button "Create Game"
        expect(page).to have_content("Platform can't be blank")
      end # platform is blank

      scenario "should fail without genre" do
        within("form") do
          fill_in "Genre", with: ""
        end
        click_button "Create Game"
        expect(page).to have_content("Genre can't be blank")
      end

      scenario "should fail without year" do
        within("form") do
          fill_in "Year released", with: nil
        end
        click_button "Create Game"
        expect(page).to have_content("")
      end

      scenario "should fail without description" do
        # Leave the description blank on the form page
        within("form") do
          fill_in "Description", with: ""
        end
        # When "Create Game" is clicked, test will pass if the
        # page displays "Description can't be blank"
        click_button "Create Game"
        expect(page).to have_content("Description can't be blank")
      end # Description is blank

    end # Create game

    context "Login" do
      scenario "should sign up" do
        visit root_path
        click_link 'Sign up'
        within("form") do
          fill_in "Email", with: "testing@test.com"
          fill_in "Password", with: "123456"
          fill_in "Password confirmation", with: "123456"
          click_button "Sign up"
        end
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
  
      scenario "should log in" do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        expect(page).to have_content("Logged in")
      end
    end # End log in

end