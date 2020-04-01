class InternalsController < ApplicationController
  before_action :set_internal, only: [:show, :edit, :update, :destroy]
  before_action :set_form_options, only: [:new, :create, :edit, :update]
  def index
    @internals = Internal.all
    @new_internal = Internal.new
  end

  def new
    @internal = Internal.new
    @internal.publishable = true
    respond_to do |format|
      format.js
    end
  end

  def create
    @internal = Internal.new(internal_params)
    respond_to do |format|
      if @internal.save!
        flash[:notice] = "Creado exitosamente"
        format.html {redirect_to internals_path}
        format.js
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to internals_path, alert:"ERROR"}
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
      if @internal.update(internal_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to internals_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to internals_path}
      end
    end
  end

  def destroy
  end

  private
  def set_internal
    @internal = Internal.find(params[:id])
  end

  def internal_params
    params.require(:internal).permit(:name, :number, :kind, :publishable, :office_id, :telephone_switch_id)
  end

  def set_form_options
    @kind_options = Internal.get_kind_options
    @office_options = Internal.get_office_options
    @telephone_switch_options = Internal.get_telephone_switch_options
  end
end
