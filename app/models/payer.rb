class Payer < ApplicationRecord
    has_many :transactions
    has_many :users, through: :transactions

    validates_presence_of :name
end
