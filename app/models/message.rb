class Message < ApplicationRecord
  belongs_to :recipient_user, class_name: 'User' #foreign_key:"recipient_user_id"
  belongs_to :sender_user, class_name: 'User' #foreign_key:"sender_user_id"
  belongs_to :user
end
