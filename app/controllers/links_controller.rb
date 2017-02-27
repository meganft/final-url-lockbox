class LinksController < ApplicationController

  before_action :authorize

  def index
    @hot_links = Link.hot
  end

  def authorize
   redirect_to login_path unless current_user
 end
 
end
