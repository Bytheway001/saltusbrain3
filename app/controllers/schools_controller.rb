class SchoolsController < ApplicationController
  def clear
    School.destroy_all
    flash[:notice]='Se borraron todas las Escuelas (y los estudios relacionados)'
    redirect_to root_url
  end

  def index
  	@schools=School.all
  end

  def show	
  	@school=School.find(params[:id])
  end
end
