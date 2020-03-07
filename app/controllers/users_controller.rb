class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_form_options, only: [:new, :create, :edit, :update]
  def index
    @users = User.all
    @new_user = User.new
  end

  def new
    @user = User.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save!
        flash[:notice] ="Creado exitosamente"
        format.html {redirect_to users_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to users_path, alert:"ERROR"}
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
      if @user.update(user_params)
        flash[:notice] ="Editado exitosamente"
        format.html {redirect_to users_path}
      else
        flash[:danger] ="Contiene errores"
        format.html {redirect_to users_path}
      end
    end
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :dni, :office_id)
  end

  def set_form_options
    @office_options = Office.get_office_options
  end
end
