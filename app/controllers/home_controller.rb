class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @info = Information.page(params[:page]).order('created_at DESC')
  end
end
