class WebController < ApplicationController

  before_filter :authenticate_user!

  def show
    render "web/#{params[:id]}"
  end

end
