class HomeController < ApplicationController
   before_action :authenticate_user!, :except => [:index]
   PER = 5
  def index
    @info = Information.page(params[:page]).per(PER).all.order('created_at DESC')
  end
end
