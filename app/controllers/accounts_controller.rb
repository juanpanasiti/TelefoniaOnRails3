class AccountsController < ApplicationController
  before_action :account, only: [:edit, :update]

  def new
    @account = Account.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save!
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
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :number)
    end

end
