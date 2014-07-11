class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :sent_greetings, class_name: "Greeting", foreign_key: :sender_id
  has_many :received_greetings, class_name: "Greeting", foreign_key: :receiver_id
  
end
