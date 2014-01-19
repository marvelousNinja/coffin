class Payment < ActiveRecord::Base
  include Concerns::Payment::RailsAdmin
  before_save do
    self.sum = basic_part.to_i + percent_part.to_i
  end
end
