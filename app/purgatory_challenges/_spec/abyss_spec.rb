require 'rails_helper'
RSpec.describe Invoice, type: :model do
  context "abyss" do
    xit "can select customer ids" do
      expect(Invoice.select_customer_ids.take(10).map(&:id).compact).to eq([])

      customer_ids = [1, 1, 1, 1, 1, 1, 1, 1, 2, 3]

      expect(Invoice.select_customer_ids.take(10).map(&:customer_id).compact).to eq(customer_ids)
    end

    xit "understands the difference between pluck and select" do
      plucked_class = String
      expect(Invoice.pluck_status.take(10).map(&:class).first).to eq(plucked_class)

      selected_class = Invoice
      expect(Invoice.select_status.take(10).map(&:class).first).to eq(selected_class)
    end

    xit "understands performance of pluck vs select" do
      expect(Invoice.select_is_faster_than_pluck_head_to_head).to eq(true)

      expect(Invoice.pluck_is_faster_than_select_for_specific_data).to eq(true)
    end
  end
end
