require_relative '../lib/account'

describe Account do

  subject(:acc){described_class.new}
  let(:deposit){double("transaction",
                        amount: 500,
                        date: DateTime.parse("01/02/2016"),
                        isCredit: true)}
  let(:withdrawal){double("transaction",
                            amount: 500,
                            date: DateTime.parse("11/04/2016"),
                            isCredit: false)}

  context "to start with" do
    it "has a 0 balance" do
      expect(acc.balance).to eq(0)
    end

    it "has an empty transaction history" do
      expect(acc.history).to eq([])
    end
  end

  it "lets you deposit money" do
    allow(deposit).to receive(:current_balance)
    acc.process(deposit)
    expect(acc.balance).to eq(500)
  end

  it "lets you withdraw money" do
    allow(withdrawal).to receive(:current_balance)
    acc.process(withdrawal)
    expect(acc.balance).to eq(-500)
  end

  it "saves the transaction into its transaction history" do
    allow(deposit).to receive(:current_balance)
    acc.process(deposit)
    expect(acc.history).to include(deposit)
  end
end
