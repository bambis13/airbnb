class Message < ApplicationRecord
<<<<<<< HEAD
  # belongs_to :recipient_user, class_name: 'User', #foreign_key:"recipient_user_id"
  # belongs_to :sender_user, class_name: 'User', #foreign_key:"sender_user_id"
  # belongs_to :user
=======
  belongs_to :recipient_user, class_name: 'User' #foreign_key:"recipient_user_id"
  belongs_to :sender_user, class_name: 'User' #foreign_key:"sender_user_id"
  belongs_to :user
>>>>>>> 681c09370109495e78d9a757efef0dc63415531e
end
