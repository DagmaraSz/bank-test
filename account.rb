require_relative 'transaction'

class Account

  attr_reader :history

  def initialize
    @balance = 0.0
    @history = []
  end

  def balance
    @balance.round(2)
  end

  def credit(amount, date, isCredit)
    update_balance(amount, isCredit)
    add_history(amount, date, isCredit, balance)
    #transaction could infer credit/debit based on balance?
  end

  private

  def add_history(amount, date, isCredit, balance)
    @history.push(Transaction.new(amount, date, isCredit, balance))
  end

  def update_balance(amount, isCredit)
    isCredit ? @balance += amount : @balance -= amount
  end

end
