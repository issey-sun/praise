require 'rails_helper'

RSpec.describe "Answers", type: :request do
  describe "#show" do
    before do
      @p_definition = FactoryBot.create(:p_definition)
    end
    it "302レスポンスを返すこと" do
      get p_definition_path(id: @p_definition.id)
      expect(response.status).to eq 302
    end
  end
end