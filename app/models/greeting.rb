class Greeting < ActiveRecord::Base

  validates :body, presence: true
  validates :receiver_id, presence: true

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  
end