require 'rails_helper'

RSpec.describe "Definitions", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @definition_title = Faker::Lorem.sentence
    @definition_body = Faker::Lorem.sentence
  end
  context '投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
    # ログインする
    sign_in(@user)

    # 新規投稿ページへのリンクがあることを確認する
    expect(page).to have_content('投稿')

    # 投稿作成ページに移動する
    visit new_definition_path

    # フォームに情報を入力する
    fill_in 'definition[title]', with:@definition_title
    fill_in 'definition[body]', with: @definition_body

    # 送信するとDefinitionモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Definition.count }.by(1)

    # 投稿完了ページに遷移することを確認する
    expect(current_path).to eq(root_path)

    # トップページに遷移する
    visit root_path

    # トップページには先ほど投稿した内容の投稿が存在することを確認する
    expect(page).to have_content(@definition_title)
    end
  end
  context '投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
       # トップページに遷移する
       visit root_path

       # 新規投稿ページへのリンクがない
       expect(page).to have_no_content('投稿')
    end
  end
end

RSpec.describe '投稿の編集', type: :system do
  before do
    @definition1 = FactoryBot.create(:definition)
    @definition2 = FactoryBot.create(:definition)
  end
  context '投稿の編集ができるとき' do
      it 'ログインしたユーザーは自分が投稿した投稿の編集ができる' do
        # definition1を投稿したユーザーでログインする
        sign_in(@definition1.user)

        # 投稿ページに移動する
        visit definition_path(@definition1.id)

        # definition1に「編集」ボタンがあることを確認する
        expect(page).to have_content('編集する'), href: edit_definition_path(@definition1)

        # 編集ページへ遷移する
        visit edit_definition_path(@definition1)

        # すでに投稿済みの内容がフォームに入っていることを確認する
        expect(
          find('#definition_title').value
        ).to eq(@definition1.title)
        expect(
          find('#definition_body').value
        ).to eq(@definition1.body)

        # 投稿内容を編集する
        fill_in 'definition_title', with: "#{@definition1.title}+編集したタイトル"
        fill_in 'definition_body', with: "#{@definition1.body}+編集した詳細"

        # 編集してもdefinitiontモデルのカウントは変わらないことを確認する
        expect{
          find('input[name="commit"]').click
        }.to change { Definition.count }.by(0)

        # 編集完了画面に遷移したことを確認する
        expect(current_path).to eq(root_path(@definition1))

        # トップページには先ほど変更した内容の投稿が存在することを確認する
        expect(page).to have_content("#{@definition1.title}+編集したタイトル")
    end
  end
  context '投稿の編集ができないとき' do
      it 'ログインしたユーザーは自分以外が投稿した投稿の編集画面には遷移できない' do
        # ログインする
        sign_in(@definition1.user)

        # definition2を投稿したユーザーとして投稿ページに遷移する
        visit definition_path(@definition2.id)

        # 「編集」ボタンがないことを確認する
        expect(page).to have_no_content('編集する'), href: edit_definition_path(@definition1)
      end
      it 'ログインしていないと投稿の編集画面には遷移できない' do
        # 投稿ページに移動する
        visit definition_path(@definition1.id)

        # definition1に「編集」ボタンがないことを確認する
        expect(page).to have_no_content('編集する'), href: edit_definition_path(@definition1)
      end
  end
end

RSpec.describe '投稿の削除', type: :system do
  before do
    @definition1 = FactoryBot.create(:definition)
    @definition2 = FactoryBot.create(:definition)
  end
    context '投稿の削除ができるとき' do
        it 'ログインしたユーザーは自らが投稿した投稿の削除ができる' do
        # definition1を投稿したユーザーでログインする
        sign_in(@definition1.user)

        # 投稿ページに移動する
        visit definition_path(@definition1.id)

        # definition1に「削除」ボタンがあることを確認する
        expect(page).to have_content('削除する'), href: definition_path(@definition1)

        # 投稿を削除するとレコードの数が1減ることを確認する
        expect{
          find_link('削除する', href: definition_path(@definition1)).click }.to change { Definition.count }.by(-1)

        # 削除完了画面に遷移したことを確認する
        expect(current_path).to eq(root_path)

        # トップページにはdefinition1の内容が存在しないことを確認する（テキスト）
        expect(page).to have_no_content("#{@definition1.title}")
        end
  end
    context '投稿が削除ができないとき' do
        it 'ログインしたユーザーは自分以外が投稿した内容の削除ができない' do
          # definition1を投稿したユーザーでログインする
          sign_in(@definition1.user)

          # definition2を投稿したユーザーとして投稿ページに遷移する
          visit definition_path(@definition2.id)

          # definition2に「削除」ボタンが無いことを確認する
          expect(page).to have_no_content('削除する'), href: definition_path(@definition1)
        end
        it 'ログインしていないと投稿の削除ボタンがない' do
          # 投稿ページに移動する
          visit definition_path(@definition1.id)

          # definition1に「編集」ボタンがないことを確認する
          expect(page).to have_no_content('削除する'), href: definition_path(@definition1)
        end
    end
end