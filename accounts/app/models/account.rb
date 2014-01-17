class Account < ActiveRecord::Base
  validates :balance, presence: true, numericality: {
    only_integer: true
  }

  validates :add, numericality: {
    only_integer: true,
    greater_than: 0
  }

  before_save do
    self.balance += add
    self.add = nil
  end

  rails_admin do
    edit do
      field :add
    end
  end
end
