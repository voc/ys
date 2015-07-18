require "spec_helper"

RSpec.describe UserSessionsController, type: :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      response
      expect(response.status).to eq(200)
    end
  end

  describe "GET #destroy" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      response
      expect(response.status).to eq(200)
    end
  end
end
