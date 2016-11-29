Given (/^a client has an account$/) do
  acc = Account.new
end

And (/^makes a ([a-z]*) of ([0-9]*) on (.*)$/) do |transaction, amount, date|
  (transaction == "deposit") ? acc.credit(amount, date, true) : acc.credit(amount, date, false)
end

Then (/^she would see the right bank statement$/) do
  expect {acc.print_statement()}.to output(
    "date       || credit || debit   || balance
    14/01/2012 ||        || 500.00  || 2500.00
    13/01/2012 || 2000.00||         || 3000.00
    10/01/2012 || 1000.00||         || 1000.00"
  ).to_stdout
end
