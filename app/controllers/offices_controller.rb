class OfficesController < ApplicationController
  before_action :set_office, only: [:edit, :update]
  before_action :set_form_options, only: [:new, :create, :edit, :update]

  def new
    @office = Office.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @office = Office.new(office_params)
    respond_to do |format|
      if @office.save!
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
      if @office.update(office_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to adminzone_index_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to adminzone_index_path}
      end
    end
  end
  private
    def set_office
      @office = Office.find(params[:id])
    end

    def office_params
      params.require(:office).permit(:office_id, :name, :category)
    end

    def set_form_options
      @offices_options = Office.get_office_options
      @categories_options = Office.get_category_options
    end
end
