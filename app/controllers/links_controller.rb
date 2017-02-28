class LinksController < ApplicationController

  before_action :authorize

  def index
    @hot_links = current_user.links.hot
    @links = Link.where(user_id: current_user.id).reverse
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(update_link_params)
    if @link.save
      flash[:success] = "Successfully updated this link!"
      redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages.first
      render :edit
   end
  end

  def destroy

  end

  def authorize
   redirect_to login_path unless current_user
  end

  private

    def update_link_params
      params.require(:link).permit(:url, :title)
    end

end
