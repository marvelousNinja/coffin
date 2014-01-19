class PdfTemplate < ActiveRecord::Base
  include Concerns::PdfTemplate::RailsAdmin
  include Concerns::PdfTemplate::Validations
  include Concerns::PdfTemplate::RailsAdmin
  include Concerns::PdfTemplate::Resolver

  after_save do
    PdfTemplate::Resolver.instance.clear_cache
  end
end
