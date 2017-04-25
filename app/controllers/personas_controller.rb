  class PersonasController < ApplicationController
    before_action :set_cache_buster, :only=>[:cv]
    #ATRIBUTOS:
      #nombre, apellido, email, direccion, user_id
    autocomplete :empresa, :nombre
    autocomplete :school, :nombre
    autocomplete :academy, :nombre
    before_action :authenticate_user!,
                  :except=>[:clear,:cv,:autocomplete_empresa_nombre,:autocomplete_school_nombre,:autocomplete_academy_nombre]
    before_action :set_persona, :only=>[:show,:edit,:update]
    def index
      @personas=Persona.all
    end

    def cv
      @persona=Persona.find(params[:persona_id])
    end

    def edit
    end

    def show
    end

    def clear
      Persona.destroy_all
      flash[:notice]='Se borraron todas las personas'
      redirect_to root_url
    end

    def update
      if @persona.update(persona_params)
        redirect_to personas_path
      else
        render 'edit'
      end
    end

    private
    def set_persona
      @persona=Persona.find(params[:id])
    end

    def persona_params
      params.require(:persona).permit(:nombre,:apellido,:direccion,:cargos_attributes=>[:nombre,:inicio,:fin,:_destroy])
    end
  end
