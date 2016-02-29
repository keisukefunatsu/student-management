class UsersController < ApplicationController
before_action :authenticate_user!
before_action :admin_user, except: [:show]
  def show
      @user = current_user
  end
end
