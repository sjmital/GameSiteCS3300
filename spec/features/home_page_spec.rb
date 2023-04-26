RSpec.feature "HomePages", type: :feature do
  
  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user)
  end

    scenario "The visitor should see games" do
      visit root_path
      expect(page).to have_text("Link to Add a New Game to the Site")
    end
  end
  
  