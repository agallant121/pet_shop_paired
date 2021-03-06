class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :favorites

  def favorites
    @favorites ||= Favorite.new(session[:fav_pets])
  end
end
