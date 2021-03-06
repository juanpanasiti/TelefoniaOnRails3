class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]
  before_action :set_form_options, only: [:new, :create, :edit, :update]
  def index
    @lines = Line.all

  end

  def new
    @line = Line.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @line = Line.new(line_params)
    respond_to do |format|
      if @line.save!
        flash[:notice] ="Creado exitosamente"
        format.html {redirect_to lines_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to lines_path}
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
      if @line.update(line_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to lines_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to lines_path}
      end
    end
  end

  def destroy
  end

  private
  def set_line
    @line = Line.find(params[:id])
  end

  def line_params
    params.require(:line).permit(:number, :user_id, :status, :account_id, :lastCheck, :plan_id, :sim, :details)
  end

  def set_form_options
    @user_options = Line.get_user_options
    @status_options = Line.get_status_options
    @account_options = Line.get_account_options
    @plan_options = Line.get_plan_options
    @sim_options = Line.get_sim_options
  end
end
