require 'rails_helper'

RSpec.describe "Reviews", type: :system, js: true do
  before do
    @definition = FactoryBot.create(:definition)
    @review = FactoryBot.create(:review)
  end
    describe '#create,#destroy' do
      context 'レビューができるとき' do
        it 'ユーザーが投稿に対してレビューができる' do
        # ログインする
        sign_in(@definition.user)
        
        #新規レビューを作成する
        review_up(@review)

        # # レビュー詳細ページに遷移する
        visit definition_reviews_path(@definition)

        # レビュー詳細ページにてレビューした投稿があることを確認する
         expect(page).to have_content(@review.score)
         expect(page).to have_content(@review.content)
        end
       end

      context 'レビューができないとき' do
        it 'ユーザーが投稿に対してレビューをすでにしており、レビューができない' do
         # ログインする
         sign_in(@definition.user)
          
         # レビュー作成ページに遷移する
         visit new_definition_review_path(@definition)
 
         #新規レビューを作成する
         review_up(@review)
           
          # レビュー作成ページに遷移する
          visit new_definition_review_path(@definition)

           # 星マークにカーソルを合わた場所でクリックする（今回は3段階）
         expect(find('#star3').hover.click)
 
         # レビューのコメントに情報を入力する
         fill_in 'review[content]', with: @review.content
           
         # レビューのコメントを送信すると、Reviewモデルのカウントが上がらないことを確認する
         expect{
          find('input[name="commit"]').click
        }.to change { Review.count }.by(0)

        # レビューページへ戻されることを確認する
         expect(current_path).to eq(definition_reviews_path(@definition))
        end
     end
  end
end