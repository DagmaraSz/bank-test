require_relative 'transaction'

class Account

  attr_reader :history, :balance

  def initialize
    @balance = 0.0
    @history = []
  end

  def process(transaction)
    update_balance(transaction)
    add_to_history(transaction)
  end

  private

  def add_to_history(transaction)
    transaction.current_balance(balance)
    @history.push(transaction)
  end

  def update_balance(transaction)
    transaction.isCredit ? @balance += transaction.amount : @balance -= transaction.amount
  end

end
