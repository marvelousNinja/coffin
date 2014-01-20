module Concerns::LoanAgreement::Pdf
  extend ActiveSupport::Concern

  included do
    mount_uploader :pdf, PdfUploader

    #after_save :generate_pdf

    def generate_pdf
      wicked = WickedPdf.new

      # Make a PDF in memory
      pdf_file = wicked.pdf_from_string(
        ActionController::Base.new().render_to_string(
          :template   => credit_product.template_path#,
          #:layout     => 'layouts/pdf.html.haml',
          #:locals     => {
          #    :aggregation => self
          #}
        ),
        :pdf => "#{self.class}-#{self}",
        #:layout => 'pdf.html',
        #:page_size => 'Letter',
        #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
        :margin => {
          :top      => '20',
          :bottom   => '20',
          :left     => '20',
          :right    => '20'
        },
      )

      # Write it to tempfile
      tempfile = Tempfile.new(['agreement', '.pdf'], Rails.root.join('tmp'))
      tempfile.binmode
      tempfile.write pdf_file
      tempfile.close

      # Attach that tempfile to the invoice
      self.pdf = tempfile
      save!
      #unless pdf.blank?
      #  self.uploads.clear
      #  self.uploads.create(:fileinfo => File.open(tempfile.path))
      #  tempfile.unlink
      #end
    end
  end
end