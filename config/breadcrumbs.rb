crumb :root do
  link "投稿一覧", root_path(anchor:"definitions")
end

crumb :answers do
  link "回答", definition_path
  parent :root
end

crumb :p_answers do
link "回答", p_definition_path
parent :root
end

crumb :reviews_watch do
link "レビューを見る", definition_reviews_path
parent :root
end

crumb :reviews_write do
link "レビューを書く", new_definition_review_path
parent :root
end

crumb :definition do
link "倫理パート", new_definition_path
parent :root
end

crumb :p_definition do
link "褒めるパート", new_p_definition_path
parent :root
end

crumb :p_reviews_watch do
link "レビューを見る", p_definition_p_reviews_path
parent :root
end
  
crumb :p_reviews_write do
link "レビューを書く", new_p_definition_p_review_path
parent :root
end

crumb :edit do
link "編集", edit_definition_path
parent :answers
end

crumb :p_edit do
link "編集", edit_p_definition_path
parent :p_answers
end

crumb :user_lists do
link "ユーザー一覧", users_path
parent :root
end

crumb :user_detail do
link "ユーザー詳細", user_path
parent :user_lists
end

crumb :registration do
link "新規登録", new_user_registration_path
parent :root
end

crumb :session do
link "ログイン", new_user_session_path
parent :root
end

crumb :notifications do
link "通知", notifications_path
parent :root
end

crumb :registration_edit do
  link "ユーザー情報編集", edit_user_registration_path
  parent :user_lists
end
  



# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).