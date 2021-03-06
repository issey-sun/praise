class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @definitions = Definition.all
    @p_definitions = PDefinition.all
    @likes = Like.all
    @definition_key = Definition.ransack(params[:q])
    @p_definition_key = PDefinition.ransack(params[:q])
    @p_search_definitions = @p_definition_key.result(distinct: true).page(params[:page])
    @search_definitions = @definition_key.result(distinct: true).page(params[:page])
    @users = User.all
    @user_key = User.ransack(params[:q])
    @search_feeds = @user_key.result(distinct: true).page(params[:page])
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :occupation, :position, :birth_day, :sex_id, :image])
  end

  def after_inactive_sign_up_path_for(resource)
    root_path(anchor:"definitions")                  
  end

  def after_sign_in_path_for(resource)
    root_path(anchor:"definitions") 
  end

  

end
