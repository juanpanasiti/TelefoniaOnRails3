class IpPhonesController < ApplicationController
  before_action :set_ip_phone, only: [:show, :edit, :update, :destroy]
  before_action :set_form_options, only: [:new, :create, :edit, :update]
  def index
    @ip_phones = IpPhone.all
    @new_ip_phone = IpPhone.new
  end

  def new
    @ip_phone = IpPhone.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @ip_phone = IpPhone.new(ip_phone_params)
    respond_to do |format|
      if @ip_phone.save!
        flash[:notice] ="Creado exitosamente"
        format.html {redirect_to ip_phones_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to ip_phones_path, alert:"ERROR"}
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
      if @ip_phone.update(ip_phone_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to ip_phones_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to ip_phones_path}
      end
    end
  end

  def destroy
  end

  private
  def set_ip_phone
    @ip_phone = IpPhone.find(params[:id])
  end

  def ip_phone_params
    params.require(:ip_phone).permit(:name, :number, :ipAddress)
  end

  def set_form_options
    #@office_options = Office.get_office_options
  end
end
