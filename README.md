This meets the requirements set out in the [Makers Academy Bank Tech Test](https://github.com/makersacademy/bank_tech_test):
- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

To try it out:

1. Clone this repo to your machine
2. Navigate into the directory
3. Run `bundle` to install the necessary dependencies
4. Run the tests: `rspec`
5. Launch IRB then require the necessary files:
`require './lib/account.rb'`
`require './lib/deposit.rb'`
`require './lib/log.rb'`
`require './lib/printer.rb'`
`require './lib/withdrawal.rb'`
6. Now you can initialize an account - `account = Account.new` - and carry out transactions:
`deposit = Deposit.new(amount:3)`
`account.transaction(deposit)`
`withdrawal = Withdrawal.new(amount:3)`
`account.transaction(withdrawal)`
7. Print a statement: `account.print_statement`

