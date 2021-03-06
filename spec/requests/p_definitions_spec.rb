require 'rails_helper'
describe PDefinitionsController, type: :request do

  before do
    @p_definition = FactoryBot.create(:p_definition)
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
      get p_definition_path(id: @p_definition.id)
      expect(response.status).to eq 302
    end
  end 

  describe "GET #new" do
    it "newアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get new_p_definition_path
      expect(response.status).to eq 200
    end
  end

  describe "GET #edit" do
    it "editアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get edit_p_definition_path(id: @p_definition.id)
      expect(response.status).to eq 200
    end
  end

  describe "destroy" do
      it "p_definitionを削除できる" do
        delete p_definition_path(id: @p_definition.id)
        expect(response.status).to eq 302
      end
  end
end