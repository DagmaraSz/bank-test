require_relative '../transaction'

describe Transaction do

  subject(:transaction) {described_class.new(500, "08/09/2014", true, 500)}

  context "on creation" do
    it "has an amount (with 2 decimal points)" do
      expect(transaction.amount).to eq(500.00)
    end
    it "has a date" do
      expect(transaction.date).to eq(DateTime.parse("08/09/2014"))
    end
    it "knows if it's a credit" do
      expect(transaction.isCredit).to be true
    end
  end
end
