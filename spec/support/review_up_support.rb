module ReviewUpSupport
  def review_up(review)
  # レビュー作成ページに遷移する
  visit new_definition_review_path(@definition)

  # レビューの存在の確認
  expect(page).to have_selector '#star1'
  expect(page).to have_selector '#star2'
  expect(page).to have_selector '#star3'
  expect(page).to have_selector '#star4'
  expect(page).to have_selector '#star5'

  # 星マークにカーソルを合わた場所でクリックする（今回は3段階）
  expect(find('#star3').hover.click)

  # レビューのコメントに情報を入力する
  fill_in 'review[content]', with: review.content

  # レビューのコメントを送信すると、Reviewモデルのカウントが1上がることを確認する
  expect{
    find('input[name="commit"]').click
  }.to change { Review.count }.by(1)
  end
end