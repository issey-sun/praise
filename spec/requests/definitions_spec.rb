require 'rails_helper'
describe DefinitionsController, type: :request do

  before do
    @definition = FactoryBot.create(:definition)
    @user = FactoryBot.create(:user)
  end

  describe "GET #index" do
    it "正常にレスポンスを返すこと" do
      get root_path
      expect(response).to be_successful
    end
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get root_path
      expect(response.status).to eq 200
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると302レスポンスを返すこと" do 
      get definition_path(id: @definition.id)
      expect(response.status).to eq 302
    end
  end 

  describe "GET #new" do
    it "newアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get new_definition_path
      expect(response.status).to eq 200
    end
  end

  describe "GET #edit" do
    it "editアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get edit_definition_path(id: @definition.id)
      expect(response.status).to eq 200
    end
  end

  describe "destroy" do
      it "definitionを削除できる" do
        delete definition_path(id: @definition.id)
        expect(response.status).to eq 200
      end
  end
end