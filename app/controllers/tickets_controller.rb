class TicketsController < ApplicationController
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
      redirect_to root_path, flash[:notice] = '参加登録しました'
    else
      redirect_to root_path
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
