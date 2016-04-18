class LinksController < ApplicationController
  before_action :unauthenticated_user

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    if link.save
      current_user.links << link
      redirect_to root_path
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :index
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :title)
    end
end
