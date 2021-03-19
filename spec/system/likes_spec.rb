require 'rails_helper'

RSpec.describe "Likes", type: :system do
    before do
      @definition = FactoryBot.create(:definition)
      @answer = FactoryBot.create(:answer)
    end

    describe '#create,#destroy' do
      it 'ユーザーが他の投稿をいいね、いいね解除できる' do
        # ログインする
        sign_in(@definition.user)
          
        # 投稿詳細ページに遷移する
        visit definition_path(@definition.id)
          
        # フォームに情報を入力する
        fill_in 'answer_answer', with: @answer
          
        # 回答を送信すると、Answerモデルのカウントが1上がることを確認する
        expect{
          find('input[name="commit"]').click
        }.to change { Answer.count }.by(1)
          
        # いいねをするボタンを押す
        find('#nolike-btn').click
        expect(page).to have_selector '#liking-btn'
        expect(@answer.likes.count).to eq(1)

        # いいねを解除する
        find('#liking-btn').click
        expect(page).to have_selector '#nolike-btn'
        expect(@answer.likes.count).to eq(0)
        end
     end
end