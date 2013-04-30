module Banking
  class BankManager
    attr_accessor :account_holder_list

    def initialize(account_holder_list)
      @account_holder_list = account_holder_list
    end

    def get_list_of_account_holders
      @account_holder_list
    end

    def add_account_holder(account_holder)
      @account_holder_list << account_holder
    end

    def add_account_holders(*account_holders)
      account_holders.each do |account_holder|
        @account_holder_list << account_holder unless account_holder_list.include? account_holder
      end
    end

    def get_list_of_top_five_account_holders
      @account_holder_list.sort { |a, b| b.get_balance <=> a.get_balance }.take(5)
    end

    def get_list_of_bottom_five_account_holders
      @account_holder_list.sort { |a, b| a.get_balance <=> b.get_balance }.take(5)
    end


  end
end
