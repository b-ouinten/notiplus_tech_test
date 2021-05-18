class DealMember < ApplicationRecord
  belongs_to :deal
  belongs_to :user_account
end
