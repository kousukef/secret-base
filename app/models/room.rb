class Room < ApplicationRecord
  has_many :chat_messages, dependent: :destroy
end
