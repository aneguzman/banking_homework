module Banking
  require 'Date'
  class Account
    # To change this template use File | Settings | File Templates.
    attr_accessor :balance, :date, :id

    def initialize(balance,id)
      @balance = balance
      @date = { }
      @id = id
    end

    def id
      @id
    end

    def add_amount(amount)
      if amount > 0 then
        @balance+= amount
        update_date
      else
        -1
      end
    end

    def withdraw(amount)
      if @balance >= amount && amount > 0 then
       @balance -= amount
       update_date
       amount
      else
       -1
      end
    end

    def transfer_money(account2, amount)
      if amount <= @balance && amount > 0 then
        @balance -= amount
        account2.balance += amount
        update_date
        'transfer'
      else
        -1
      end
    end

    def get_balance(date)
      if @date[date] then
        @date[date]
      else
        -1
      end
    end

    def update_date
      @date[DateTime.now] = @balance
    end
  end
end