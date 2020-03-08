class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :set_form_options, only: [:new, :create, :edit, :update]
  def index
    @devices = Device.all
    @new_device = Device.new
  end

  def new
    @device = Device.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @device = Device.new(device_params)
    respond_to do |format|
      if @device.save!
        flash[:notice] ="Creado exitosamente"
        format.html {redirect_to devices_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to devices_path, alert:"ERROR"}
        #
      end
    end
  end

  def show
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @device.update(device_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to devices_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to devices_path}
      end
    end
  end

  def destroy
  end

  private
  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:imei, :isExternal, :details, :device_model_id, :line_id, :status)
  end

  def set_form_options
    @models_options = DeviceModel.get_device_model_options
    @lines_options = Line.get_line_options
    @status_options = Device.get_status_options
  end
end
