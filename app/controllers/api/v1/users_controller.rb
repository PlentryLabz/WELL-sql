class Api::V1::UsersController < Api::V1::ApplicationController
  before_filter :authenticate_user!, only: [:update]

  def index
    search = User.search(params[:q])
    @users = filter.page(params[:page]).per(20)
    respond_with(@users, location: nil)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user, location: nil)
  end

end