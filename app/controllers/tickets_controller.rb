class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, except: [:create,:destroy,:new]
  def index
    @info = Information.find(params[:information_id])
    @tickets = @info.tickets

  end
  def new
    raise ApplicationController::RoutingError,'申し訳ありません、ログインしてからお申し込みください。'
  end

  def create
    ticket = current_user.tickets.build do |t|
      t.information_id = params[:information_id]
      t.comment = params[:ticket][:comment]
    end
    if ticket.save
      flash[:notice] = '参加登録しました'
      head 201
    else
      render json: {messages: ticket.errors.full_messages},status: 422
    end
  end

  def show
  end

  def destroy
    ticket = current_user.tickets.find_by!(information_id: params['information_id'])
    ticket.destroy!
    redirect_to root_path,notice: 'イベントへの参加をキャンセルしました'
  end
end
