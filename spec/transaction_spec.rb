describe Transaction do

  subject(:transaction) {described_class.new}

  context "on creation" do
    it "has an amount" do
      expect(transaction.amount).to be(a(BigDecimal))
    end
    it "has a date" do
      expect(transaction.date).to be(a(Date))
    end
    it "knows if it's a credit" do
      expect([true, false]).to include(transaction.credit)
    end
end
