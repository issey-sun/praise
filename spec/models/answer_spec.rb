require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @answer = FactoryBot.build(:answer)
  end

  describe '投稿' do
    context '投稿がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@answer).to be_valid
      end
    end

    context '投稿が上手くいかないとき' do
      it "answerが空だと登録できない" do
        @answer.answer = ''
        @answer.valid?
        expect( @answer.errors.full_messages).to include("Answerを入力してください")
      end
      it "user_idがnilの場合は保存できない" do
        @answer.user_id = nil
        @answer.valid?
        expect(@answer.errors[:user]).to include("を入力してください")
      end
     end
  end
end