class LinksController < ApplicationController
  before_action :unauthenticated_user

  def index
    @link = Link.new
  end
end
