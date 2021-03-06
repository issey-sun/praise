require 'rails_helper'

RSpec.describe PDefinition, type: :model do
  before do
    @p_definition = FactoryBot.build(:p_definition)
  end

  describe '投稿' do
    context '投稿がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@p_definition).to be_valid
      end
      it "正しく保存できるか" do
        expect(FactoryBot.build(:p_definition)).to be_valid
      end
    end

    context '投稿が上手くいかないとき' do
      it "titleが空だと登録できない" do
        @p_definition.title = ''
        @p_definition.valid?
        expect(@p_definition.errors.full_messages).to include("Titleを入力してください")
      end
      it "bodyが空だと登録できない" do
        @p_definition.body = ''
        @p_definition.valid?
        expect(@p_definition.errors.full_messages).to include("Bodyを入力してください")
      end
     end
  end
end
