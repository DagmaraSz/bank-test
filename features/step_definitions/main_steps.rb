Given (/^a client has an account$/) do
  @acc = Account.new
end

And (/^makes a ([a-z]*) of ([0-9]*) on (.*)$/) do |transaction, amount, date|
  (transaction == "deposit") ? @acc.credit(amount.to_i, date, true) : @acc.credit(amount.to_i, date, false)
end

Then (/^she would see the right bank statement$/) do
  @statement = Statement.new(@acc.history)
  expect {@statement.print}.to output(
    "date       || credit || debit   || balance\n" +
    "14/01/2012 ||        || 500.00  || 2500.00\n" +
    "13/01/2012 || 2000.00||         || 3000.00\n" +
    "10/01/2012 || 1000.00||         || 1000.00\n"
  ).to_stdout
end
