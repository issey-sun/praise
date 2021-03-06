require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end
  describe '正常値と異常値の確認' do
    context 'reviewモデルのバリデーション' do
      it "user_idとdefinition_idがあれば保存できる" do
        expect(FactoryBot.create(:definition)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        @review.user_id = nil
        @review.valid?
        expect(@review.errors[:user_id]).to include("を入力してください")
      end

      it "definition_idがなければ無効な状態であること" do
        @review.definition_id = nil
        @review.valid?
        expect(@review.errors[:definition_id]).to include("を入力してください")
      end
    end
  end
end
