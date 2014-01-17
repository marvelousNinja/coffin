class Payment < ActiveRecord::Base
  before_save do
    self.sum = basic_part.to_i + percent_part.to_i
  end
end
