module Banking
  class AccountHolder
    # To change this template use File | Settings | File Templates.
    attr_accessor :account, :name

    def initialize(account, name)
      @account = account
      @name = name
    end

    def get_balance
      @account.balance
    end

    def withdraw_money(quantity)
      @account.withdraw(quantity)
    end

    def transfer_money_to(account2, amount)
      @account.transfer_money(account2, amount)
    end

  end
end