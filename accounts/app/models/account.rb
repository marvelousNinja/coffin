class Account < ActiveRecord::Base
  belongs_to :primary_account, :class_name => 'Account'
  has_one :secondary_account, :class_name => 'Account', :foreign_key => 'primary_id', conditions: { secondary: true }

  validates :balance, presence: true, numericality: {
    only_integer: true
  }

  validates :add, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  before_save do
    self.secondary = true if primary_id
    add_balance(add.to_i) unless primary_id
  end

  rails_admin do
    edit do
      field :add
    end
  end

  def write_off(amount)
    diff = amount - balance
    if diff > 0
      self.balance = 0
      secondary_account.balance -= diff
    else
      self.balance -= amount
    end
    self.save
    secondary_account.save
  end

  def add_and_save(amount)
    add_balance(amount)
    save
    secondary_account.save
  end

  def add_balance(amount)
    if secondary_account.balance < 0
      if secondary_account.balance * (-1) >= amount
        secondary_account.balance += amount
      else
        diff = secondary_account.balance + amount
        secondary_account.balance = 0
        self.balance += diff
      end
    else
      self.balance += add.to_i
    end
    self.add = 0
  end
end
