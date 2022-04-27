class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :payer

    validates_presence_of :timestamp, :points
end
