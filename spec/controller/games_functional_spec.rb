require "rails_helper"

#TODO Add rest of web requests, update for attributes
RSpec.describe GamesController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
                get :index
                expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:game) { Game.create(title: "Test title", description: "Test description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        
        context "GET #edit" do
            # The edit page has a title and a description when updated
            let!(:game) { Game.update(title: "Test title", description: "test description") }
            it "returns a success response" do
                # have_http_status(:ok) returns success (:ok, an alias for the
                # http success code) to the browser if the edit page is
                # successfully updated
                expect(response).to have_http_status(:ok)
            end
        end

        context "GET #create" do
            # Returns the minimal set of attributes required to create a valid game. As you add
            # validations to game, be sure to adjust the attributes here as well.
            let(:valid_attributes) {
                { :title => "Test title", :platform => "Test platform", :genre => "Test genre",
                :releaseDate => 2000, :description => "This is a test description" }
            }

            let(:valid_session) { {} }

            describe "GET #create" do
                it "returns a success response" do
                    Game.create! valid_attributes
                    get :index, params: {}, session: valid_session
                    expect(response).to have_http_status(:ok)
                end
            end
        end

    end

    describe "Create a new game" do

        # Before each test, log in the user and GET new.html.erb for the game views
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            visit new_game_path
        end

        # Test game creation using Capybara
        scenario "should be successful" do
            within("form") do
                fill_in "Title", with: "Test title"
                fill_in "Platform", with: "Test platform"
                fill_in "Genre", with: "Test genre"
                fill_in "Year released", with: 2000
                fill_in "description", with: "Test description"
            end
            click_button "Create Game"
            expect(page).to have_content("Game was successfully created")
        end
      
        # Test title non-existence using Capybara
        scenario "with no title should fail" do
            within("form") do
                fill_in "Title", with: ""
            end
            click_button "Create Game"
            expect(page).to have_content("Title can't be blank")
        end

        # Test platform non-existence using Capybara
        scenario "with no platform should fail" do
            within("form") do
                fill_in "Platform", with: ""
            end
            click_button "Create Game"
            expect(page).to have_content("Platform can't be blank")
        end

        # Test genre non-existence using Capybara
        scenario "with no genre should fail" do
            within("form") do
                fill_in "Genre", with: ""
            end
            click_button "Create Game"
            expect(page).to have_content("genre can't be blank")
        end

        # Test releaseDate non-existence using Capybara
        scenario "with no year should fail" do
            within("form") do
                fill_in "Year released", with: ""
            end
            click_button "Create Game"
            expect(page).to have_content("Title can't be blank")
        end
      
        # Test description non-existence using Capybara
        scenario "with no description should fail" do
            within("form") do
                fill_in "Description", with: ""
            end
            click_button "Create Game"
            expect(page).to have_content("Description can't be blank")
        end

    end # create a game

end
