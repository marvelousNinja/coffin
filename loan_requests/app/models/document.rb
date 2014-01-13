class Document < ActiveRecord::Base
  include Concerns::Document::Relationships
  include Concerns::Document::Enumerations
  include Concerns::Document::Validations
  include Concerns::Document::RailsAdmin
end
