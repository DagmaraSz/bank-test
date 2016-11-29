require_relative '../account'

describe Account do

  subject(:acc){described_class.new}

  context "to start with" do
    it "has a 0 balance to start with" do
      expect(acc.balance).to eq(0)
    end

    it "has an empty transaction history" do
      expect(acc.history).to eq([])
    end
  end

  it "can print statements" do
    expect(acc).to respond_to(:print_statement)
  end

  it "lets you deposit money" do
    acc.credit(500, "01/02/2016", true)
    expect(acc.balance).to eq(500)
  end

  it "lets you withdraw money" do
    acc.credit(500, "11/04/2016", false)
    expect(acc.balance).to eq(-500)
  end

  it "saves the transaction into its transaction history" do
    acc.credit(500, "01/02/2016", true)
    expect(acc.history).to include(a_kind_of(Transaction))
  end
end
