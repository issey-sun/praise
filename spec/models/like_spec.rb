require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end
  describe '正常値と異常値の確認' do
    context 'likeモデルのバリデーション' do
      it "user_idとanswer_idがあれば保存できる" do
        expect(FactoryBot.create(:like)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors[:user_id]).to include("を入力してください")
      end

      it "answer_idがなければ無効な状態であること" do
        @like.answer_id = nil
        @like.valid?
        expect(@like.errors[:answer_id]).to include("を入力してください")
      end

      it "definition_idがなければ無効な状態であること" do
        @like.definition_id = nil
        @like.valid?
        expect(@like.errors[:definition_id]).to include("を入力してください")
      end

      it "answer_idが同じでもuser_idが違うと保存できる" do
        like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, answer_id: like.answer_id)).to be_valid
      end

      it "definition_idが同じでもuser_idが違うと保存できる" do
        like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, definition_id: like.definition_id)).to be_valid
      end

      it "user_idが同じでもanswer_idが違うと保存できる" do
        like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, user_id: like.user_id)).to be_valid
      end
    end
  end

  # describe "各モデルとのアソシエーション" do
  #   let(:association) do
  #     described_class.reflect_on_association(target)
  #   end

  #   context "Answerモデルとのアソシエーション" do
  #     let(:target) { :user }

  #     it "Userとの関連付けはbelongs_toであること" do
  #       expect(association.macro).to  eq :belongs_to
  #     end
  #   end

  #   context "Answerモデルとのアソシエーション" do
  #     let(:target) { :answer }

  #     it "Answerとの関連付けはbelongs_toであること" do
  #       expect(association.macro).to  eq :belongs_to
  #     end
  #   end
  #   context "Definitionモデルとのアソシエーション" do
  #     let(:target) { :definition }

  #     it "Definitionとの関連付けはbelongs_toであること" do
  #       expect(association.macro).to  eq :belongs_to
  #     end
  #   end
  # end
end

# user_idとanswer_id、definition_idがあれば保存できる
# →ユーザー(user)が投稿(definition)することで、回答(answer）ができるので。
# 上記の3つがなければいいね(like)はできないから。

# user_idがなければ無効な状態であること
# →user_idがなければいいができないから。

# answer_idがなければ無効な状態であること
# →answer_idがなければ回答もできないので、いいねもできないから。

# definition_idがなければ無効な状態であること
# →definition_idがなければ投稿も回答もできないので、いいねもできないから。

# answer_idが同じでもuser_idが違うと保存できる


#       definition_idが同じでもuser_idが違うと保存できる
#       user_idが同じでもanswer_idが違うと保存できる
