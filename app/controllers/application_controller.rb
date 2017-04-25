class ApplicationController < ActionController::Base

  def after_sign_up_path_for(resource)
    edit_persona_path(current_user)
  end
  protect_from_forgery with: :exception

  protected
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "#{1.year.ago}"
  end
end
