require 'rails_helper'

RSpec.describe "Answers", type: :system do
  before do
    @definition = FactoryBot.create(:definition)
    @answer = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは投稿詳細ページで回答できる' do
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

      # 詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq(definition_path(@definition))
      
      # 詳細ページ上に先ほどの回答内容が含まれていることを確認する
      expect(page).to have_content @answer
  end
end