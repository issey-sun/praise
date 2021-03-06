require 'rails_helper'

RSpec.describe PReview, type: :model do
  before do
    @p_review = FactoryBot.build(:p_review)
  end
  describe '正常値と異常値の確認' do
    context 'p_reviewモデルのバリデーション' do
      it "user_idとdefinition_idがあれば保存できる" do
        expect(FactoryBot.create(:p_definition)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        @p_review.user_id = nil
        @p_review.valid?
        expect(@p_review.errors[:user_id]).to include("を入力してください")
      end

      it "p_definition_idがなければ無効な状態であること" do
        @p_review.p_definition_id = nil
        @p_review.valid?
        expect(@p_review.errors[:p_definition_id]).to include("を入力してください")
      end
    end
  end
end
