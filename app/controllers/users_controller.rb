class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def clear
    User.destroy_all
    flash[:notice]="Se destruyeron todos los usuarios"
    redirect_to root_url
  end
end
