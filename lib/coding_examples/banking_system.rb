# Design a class structure for a simple banking system.

# The system should support the following functionalities:

# Creating new accounts with a unique account number, initial balance, and account holder name.

# Depositing money into an account.

# Withdrawing money from an account (assuming sufficient balance).

# Checking the balance of an account.
 
require 'debug'
class Account
  attr_reader :account_number

  def initialize(account_number, account_holder_name)
    @account_number = account_number
    @account_holder_name = account_holder_name
    @balance = 0
  end
end
 
class BankingSystem
   attr_accessor :accounts
   
   def initialize
     @accounts = []
   end
   
   def add_accounts(account)
    # binding.break
     unless @accounts.map(&:account_number).include?(account.account_number)
       @accounts << account
     else
      puts "Account is already exist"
     end
   end
   
   def deposit_money(amount)
     @balance += amount
   end
   
   def withdraw_money(amount)
     @balance -= amount
   end
   
   def transfer_money(amount)
     if @balance >= amount
       withdraw_money(amount)
     else
       puts "Balance is not sufficient"
     end
   end
   
   def check_balance
     @balance
   end
 end
 
 account = Account.new(123, 'shareef')
 bs = BankingSystem.new
 bs.add_accounts(account)
 account1 = Account.new(123, 'shareef')
 bs.add_accounts(account1)
 puts bs.accounts.inspect
#  account.deposit_money(1000)
#  puts account.check_balance
#  account.transfer_money(2000)
# account.withdraw_money(500)
# puts account.check_balance
 