module Banking
  class Teller
    # To change this template use File | Settings | File Templates.

    def initialize(account_holder_wrappers_list)
      @account_holder_wrapper_list = account_holder_wrappers_list
    end

    def get_balance_on_a_certain_date(account_holder_wrapper, date)
      @account_holder_wrapper_list.each do |ah|
        if (ah.account.id == account_holder_wrapper.account.id) then
          return account_holder_wrapper.account.get_balance(date)
        else
          -1
        end
      end

    end
  end
end