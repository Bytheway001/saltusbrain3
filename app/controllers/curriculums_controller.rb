class CurriculumsController < ApplicationController

  def set
    @persona=Persona.find_or_create_by(:email=>params[:email])
    redirect_to persona_cv_path(@persona)
  end

  def view
    @persona=Persona.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  def select
    @persona=Persona.find(params[:id])
  end
  def update

    @persona=Persona.find(params[:id])
    if @persona.update!(persona_params)
      redirect_to select_path(@persona)
    else
      render plain: "NOT DONE"
    end
  end

  def print
    @persona=Persona.find(params[:id])
    respond_to do |format|
      format.pdf{
        render pdf: 'file_name', template: 'curriculums/previews/_'+params[:model].to_s, locals:{persona: @persona},viewport_size: '1280x1024'
      }
    end
  end
  private
  def persona_params
    params.require(:persona).permit(:id,:telefono_fijo,:telefono_celular,:nombre,:country,:facebook,:twitter,:linkedin,:github,:apellido,:direccion,:segundo_nombre,:padre,:madre,:sexo,:edo_civil,:pais,:fecha_nac,:profesion,
      :cargos_attributes=>[:id,:enterprise,:nombre,:inicio,:fin,:current,:_destroy],
      :studies_attributes=>[:escuela,:id,:titulo,:inicio,:fin,:_destroy],
      :courses_attributes=>[:academia,:id,:nombre,:inicio,:fin,:_destroy],
      :hobbies_attributes=>[:id,:nombre,:_destroy]
      )
  end
end
