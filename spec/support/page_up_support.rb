module PageUpSupport
  def page_up(definition)
    # ページ遷移していることを確認する
    expect(current_path).to eq(root_path)

    # 投稿があることを確認する
    expect(page).to have_no_content("#{definition.title}")
  end
end