require "pusher"

class GreetingsController < ApplicationController

  def create
    greeting = current_user.sent_greetings.build(greeting_params)

    if greeting.save
      push_greeting = render greeting #render returns an html blob

      Pusher[greeting.receiver_id.to_s].trigger('new_greeting', {
        greeting: push_greeting
       })  

    else
      render partial: "errors", locals: {target: greeting}, status: 422
    end 

  end

  def greeting_params
    params.require(:greeting).permit(
      :body,
      :receiver_id,
      :pusher_id
      )
  end

end
