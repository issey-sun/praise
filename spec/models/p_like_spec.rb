require 'rails_helper'

RSpec.describe PLike, type: :model do
  before do
    @p_like = FactoryBot.build(:p_like)
  end
  describe '正常値と異常値の確認' do
    context 'p_likeモデルのバリデーション' do
      it "user_idとp_answer_idがあれば保存できる" do
        expect(FactoryBot.create(:p_like)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        @p_like.user_id = nil
        @p_like.valid?
        expect(@p_like.errors[:user_id]).to include("を入力してください")
      end

      it "p_answer_idがなければ無効な状態であること" do
        @p_like.p_answer_id = nil
        @p_like.valid?
        expect(@p_like.errors[:p_answer_id]).to include("を入力してください")
      end

      it "p_definition_idがなければ無効な状態であること" do
        @p_like.p_definition_id = nil
        @p_like.valid?
        expect(@p_like.errors[:p_definition_id]).to include("を入力してください")
      end

      it "p_answer_idが同じでもuser_idが違うと保存できる" do
        p_like = FactoryBot.create(:p_like)
        expect(FactoryBot.create(:p_like, p_answer_id: p_like.p_answer_id)).to be_valid
      end

      it "p_definition_idが同じでもuser_idが違うと保存できる" do
        p_like = FactoryBot.create(:p_like)
        expect(FactoryBot.create(:p_like, p_definition_id: p_like.p_definition_id)).to be_valid
      end

      it "user_idが同じでもp_answer_idが違うと保存できる" do
        p_like = FactoryBot.create(:p_like)
        expect(FactoryBot.create(:p_like, user_id: p_like.user_id)).to be_valid
      end
    end
  end
end