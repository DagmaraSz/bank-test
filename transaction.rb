require 'date'
# is using date overkill?
# would it have been good to use BigDecimal?

class Transaction

  attr_reader :isCredit, :amount, :balance, :date

  def initialize(amount, date, isCredit, balance)
    @amount = amount
    @date = DateTime.parse(date)
    @isCredit = isCredit
    @balance = balance
  end
  
end
