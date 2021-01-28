class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
before_action :set_search

  def set_search
    @definitions = Definition.all
    @likes = Like.all
    @definition_key = Definition.ransack(params[:q])
    @search_definitions = @definition_key.result(distinct: true).page(params[:page])
    @users = User.all
    @user_key = User.ransack(params[:q])
    @search_feeds = @user_key.result(distinct: true).page(params[:page])
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :occupation, :position, :birth_day, :sex_id, :image])
  end
end
