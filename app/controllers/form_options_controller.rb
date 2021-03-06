class FormOptionsController < ApplicationController
  before_action :set_form_option, only: [:edit, :update]
  before_action :set_form_options, only: [:new, :create, :edit, :update]


  def new
    @form_option = FormOption.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @form_option = FormOption.new(form_option_params)
    respond_to do |format|
      if @form_option.save
        flash[:notice] ="Creado exitosamente"
        format.html { redirect_to adminzone_index_path}
        format.js
        #format.json { render :show, status: :created, location: @form_option }
      else
        flash[:danger] ="Contiene errores"
        format.html { render :new }
        #format.json { render json: @form_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      puts "FORM OPTIONS"
      puts @form_option.class
      if @form_option.update!(form_option_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to adminzone_index_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to devicadminzone_index_pathes_path}
      end
    end
  end

  private
    def set_form_option
      @form_option = FormOption.find(params[:id])
    end

    def form_option_params
      params.require(:form_option).permit(:entityName, :optionValue)
    end

    def set_form_options
      @fields_options = FormOption.get_fields_options
    end
end
