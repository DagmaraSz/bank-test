describe Statement do

  let(:deposit) {
    double("transaction",
            isCredit: true,
            date: DateTime.parse("01/07/2015"),
            amount: 500,
            balance: 500
            )}
  subject(:statement){described_class.new([deposit])}

  it "prints an account history" do
    expect(statement).to respond_to(:print)
  end
end
