class User < ApplicationRecord
    has_many :transactions
    has_many :payers, through: :transactions

    validates_presence_of :name

    def total_points
        self.transactions.sum(:points)
    end
    
end
