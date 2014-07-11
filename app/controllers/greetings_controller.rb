require "pusher"

class GreetingsController < ApplicationController

  def create
    greeting = current_user.sent_greetings.create(greeting_params)
    push_greeting = render greeting #returns an html file

      
    Pusher[greeting.receiver_id.to_s].trigger('new_greeting', {
      greeting: push_greeting
       })  

  end

  def greeting_params
    params.require(:greeting).permit(
      :body,
      :receiver_id,
      :pusher_id
      )
  end

end