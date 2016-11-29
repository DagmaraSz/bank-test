require 'date'
# is using date overkill?
# would it have been good to use BigDecimal?

class Transaction

  attr_reader :isCredit, :amount, :date, :balance

  def initialize(amount, date, isCredit)
    @amount = amount
    @date = DateTime.parse(date)
    @isCredit = isCredit
  end

  def current_balance(acc_balance)
    @balance = acc_balance
  end

end
