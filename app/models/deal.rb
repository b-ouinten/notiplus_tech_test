class Deal < ApplicationRecord
  belongs_to :initiator, class_name: 'UserAccount'
end
