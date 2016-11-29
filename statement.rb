class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def print
    puts("date       || credit || debit   || balance")
    transactions.reverse_each do |transaction|
      if (transaction.isCredit)
        puts (transaction.date.strftime("%d/%m/%Y") + " || " + sprintf('%.2f', transaction.amount) + "||" + "         || " + sprintf('%.2f', transaction.balance))
      else
        puts (transaction.date.strftime("%d/%m/%Y") + " ||        || " + sprintf('%.2f', transaction.amount) + "  || " + sprintf('%.2f', transaction.balance))
      end
    end
  end

  private
  attr_reader :transactions

end
