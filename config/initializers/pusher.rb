Pusher.logger = Rails.logger

Pusher.app_id = ENV.fetch("PUSHER_APP_ID")
Pusher.key    = ENV.fetch("PUSHER_PUBLIC_KEY")
Pusher.secret = ENV.fetch("PUSHER_SECRET_KEY")