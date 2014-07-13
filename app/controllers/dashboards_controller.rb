class DashboardsController < ApplicationController
  def show
   @greeting = Greeting.new
   @users = User.all
   @greetings = current_user.received_greetings.order( "created_at DESC" )
  end


  private
    def greetings_params
      params.require(:greeting).permit(
        :body,
        :receiver,
      )
    end

end