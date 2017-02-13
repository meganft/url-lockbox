class LinksController < ApplicationController
  before_action :authorize
  def index
  end

  def authorize
    redirect_to login_path unless current_user
  end

end
