require 'active_support/concern'
module Divinization
  LEVEL = 1
  extend ActiveSupport::Concern

  def unique_merchant_ids
  end

  class_methods do
    def pluck_first_names
    end

    def pluck_last_names_in_reverse_alphabetical_order
    end
  end
end
