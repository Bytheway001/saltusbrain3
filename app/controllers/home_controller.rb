class HomeController < ApplicationController
  def index
  	flash[:alert]='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  end

  def panel
  	
  end

  def building
    
  end


  def noroute!
    render plain: "la ruta es incorrecta"
  end

end
