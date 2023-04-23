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
    end
end
