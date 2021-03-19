module DefinitionUpSupport
  def definition_up(definition_title, definition_body)
 
    # 新規投稿ページへのリンクがあることを確認する
    expect(page).to have_content('投稿')

    # 投稿作成ページに移動する
    visit new_definition_path

    # フォームに情報を入力する
    fill_in 'definition[title]', with: definition_title
    fill_in 'definition[body]', with: definition_body

    # 送信するとDefinitionモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Definition.count }.by(1)

    # 投稿完了ページに遷移することを確認する
    expect(current_path).to eq(root_path)
  end
end