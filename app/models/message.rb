class Message < ApplicationRecord
  belongs_to :sender_user_id
  belongs_to :recipient_user_id
end
