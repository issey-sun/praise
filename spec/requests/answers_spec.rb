require 'rails_helper'

RSpec.describe "Answers", type: :request do
  describe "#show" do
    before do
      @definition = FactoryBot.create(:definition)
    end
    it "302レスポンスを返すこと" do
      get definition_path(id: @definition.id)
      expect(response.status).to eq 302
    end
  end
end


