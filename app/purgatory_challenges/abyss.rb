require 'active_support/concern'
module Abyss
  LEVEL = 2
  extend ActiveSupport::Concern
  
  class_methods do
    def select_customer_ids
    end

    def pluck_status
    end

    def select_status
    end

    def select_is_faster_than_pluck_head_to_head
      Benchmark.realtime { Invoice.pluck(:id) } == Benchmark.realtime { Invoice.select(:id) }
    end

    def pluck_is_faster_than_select_for_specific_data
      Benchmark.realtime { Invoice.pluck(:id) } ==
      Benchmark.realtime { Invoice.select(:id).map(&:id) }
    end
  end
end
