require 'rails_helper'

RSpec.describe Definition, type: :model do
  before do
    @definition = FactoryBot.build(:definition)
  end

  describe '投稿' do
    context '投稿がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@definition).to be_valid
      end
      it "正しく保存できるか" do
        expect(FactoryBot.build(:definition)).to be_valid
      end
    end

    context '投稿が上手くいかないとき' do
      it "titleが空だと登録できない" do
        @definition.title = ''
        @definition.valid?
        expect(@definition.errors.full_messages).to include("Titleを入力してください")
      end
      it "bodyが空だと登録できない" do
        @definition.body = ''
        @definition.valid?
        expect(@definition.errors.full_messages).to include("Bodyを入力してください")
      end
     end
  end


  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    let(:definition) { FactoryBot.create(:definition) }

    context "Likeモデルとのアソシエーション" do
      let(:target) { :likes }
      it "Likeとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Defintionが削除されたらLikeも削除されること" do
        like = FactoryBot.create(:like, definition_id: definition.id)
        expect { definition.destroy }.to change(Like, :count).by(-1)
      end
    end

    context "Answerモデルとのアソシエーション" do
      let(:target) { :answers }
      it "Answerとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Definitionが削除されたらAnswerも削除されること" do
        answer = FactoryBot.create(:answer, definition_id: definition.id)
        expect { definition.destroy }.to change(Answer, :count).by(-1)
      end
    end
  end
end
