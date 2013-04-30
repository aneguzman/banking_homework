module Banking
  class AccountHolderWrapper
    # To change this template use File | Settings | File Templates.
    attr_accessor :account_holder, :account

    def initialize(account_holder, account)
      @account_holder = account_holder
      @account = account
    end
  end
end