class HomeController < ApplicationController
  def index
  end

  def building
    render :layout => 'building'
  end


  def noroute!
    render plain: "la ruta es incorrecta"
  end

end
