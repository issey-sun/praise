require 'rails_helper'

RSpec.describe PAnswer, type: :model do
  before do
    @p_answer = FactoryBot.build(:p_answer)
  end

  describe '投稿' do
    context '投稿がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@p_answer).to be_valid
      end
    end

    context '投稿が上手くいかないとき' do
      it "p_answerが空だと登録できない" do
        @p_answer.answer = ''
        @p_answer.valid?
        expect( @p_answer.errors.full_messages).to include("Answerを入力してください")
      end
      it "user_idがnilの場合は保存できない" do
        @p_answer.user_id = nil
        @p_answer.valid?
        expect(@p_answer.errors[:user]).to include("を入力してください")
      end
     end
  end
end