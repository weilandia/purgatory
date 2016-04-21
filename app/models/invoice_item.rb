class InvoiceItem < ActiveRecord::Base
  include Purgatory
  self.convert_modules
##--

  belongs_to :item
  belongs_to :invoice

  default_scope { order(id: :asc) }
end
