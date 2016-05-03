require 'rails_helper'
RSpec.describe Customer, type: :model do
  context "divinization" do
    customers = ["Joey", "Cecelia", "Mariah", "Leanne", "Sylvester", "Heber", "Parker", "Loyal", "Dejon", "Ramona"]
    xit "can pluck first_names" do
      expect(Customer.pluck_first_names.take(10)).to eq(customers)
    end

    xit "can pluck last_names in reverse alphabetical order" do
      customers = ["Zulauf", "Zulauf", "Zulauf", "Zulauf", "Zulauf", "Zieme", "Zieme", "Zieme", "Zieme", "Zieme"]

      expect(Customer.pluck_last_names_in_reverse_alphabetical_order.take(10)).to eq(customers)
    end

    xit "can pluck a customer's unique merchant ids via invoices" do
      merchant_ids = [79, 91, 18, 86, 28, 63, 99, 1]
      expect(Customer.find(7).unique_merchant_ids).to eq(merchant_ids)
    end
  end
end
