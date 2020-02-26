class PlansController < ApplicationController
  before_action :set_plan, only: [:edit, :update]

  def new
    @plan = Plan.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @plan = Plan.new(plan_params)
    respond_to do |format|
      if @plan.save!
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
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:name, :codeName, :details)
    end
end
