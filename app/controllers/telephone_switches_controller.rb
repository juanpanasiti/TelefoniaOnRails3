class TelephoneSwitchesController < ApplicationController
  before_action :set_telephone_switch, only: [:edit, :update]
  before_action :set_form_options, only: [:new, :create, :edit, :update]

  def new
    @telephone_switch = TelephoneSwitch.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @telephone_switch = TelephoneSwitch.new(telephone_switch_params)
    respond_to do |format|
      if @telephone_switch.save!
        flash[:notice] ="Creado exitosamente"
        format.js
        format.html { redirect_to adminzone_index_path}
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
      if @telephone_switch.update(telephone_switch_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to adminzone_index_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to adminzone_index_path}
      end
    end
  end
  private
    def set_telephone_switch
      @telephone_switch = TelephoneSwitch.find(params[:id])
    end

    def telephone_switch_params
      params.require(:telephone_switch).permit(:name, :ip, :header)
    end

    def set_form_options
      #@offices_options = Office.get_office_options
    end
end
