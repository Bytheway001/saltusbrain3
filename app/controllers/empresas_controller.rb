class EmpresasController < ApplicationController

  def clear
    Empresa.destroy_all
    flash[:notice]='Se borraron todas las empresas (y los cargos relacionados)'
    redirect_to root_url
  end

  def index
  	@empresas=Empresa.all
  end

  def show
  	@empresa=Empresa.find(params[:id])
  end
end
