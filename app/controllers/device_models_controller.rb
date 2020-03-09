class DeviceModelsController < ApplicationController
  before_action :set_device_model, only: [:edit, :update]
  before_action :set_form_options, only: [:new, :create, :edit, :update]

  def new
    @device_model = DeviceModel.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @device_model = DeviceModel.new(device_model_params)
    respond_to do |format|
      if @device_model.save!
        flash[:notice] ="Creado exitosamente"
        format.html { redirect_to adminzone_index_path}
        #format.json { render :show, status: :created, location: @form_option }
      else
        flash[:danger] ="Contiene errores"
        format.html { render :new }
        #format.json { render json: @form_option.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def set_device_model
      @device_model = DeviceModel.find(params[:id])
    end

    def device_model_params
      params.require(:device_model).permit(:mark, :modelName, :modelCode, :slotSIM, :band, :osMax, :specsLink, :ramSize, :romSize, :cpuFreqMax, :cores, :screenResolution, :screenSize, :mainCam, :secCam, :battery, :usbType, :announced)
    end

    def set_form_options
      @slot_sim_options = DeviceModel.get_sim_options
      @band_options = DeviceModel.get_band_options
      @os_max_options = DeviceModel.get_os_max_options
      @usb_type_options = DeviceModel.get_usb_type_options

    end
end
