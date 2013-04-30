require 'spec_helper'
require File.dirname(__FILE__) + '/../lib/banking/account_holder.rb'

describe 'BankManger' do
  let(:account_holder_list) { [] }
  let(:account_holder1) { mock(Banking::AccountHolder) }
  let(:account_holder2) { mock(Banking::AccountHolder) }

  before do
    @sut = Banking::BankManager.new account_holder_list
  end

  subject { true }

  it 'should pass' do
    should == true
  end

  describe '#get_list_of_account_holders' do
    context 'when trying to get the list of account holders' do
      before do
        @sut.add_account_holders(account_holder1, account_holder2)
      end

      subject { @sut.get_list_of_account_holders }

      it 'should return the list of account holders' do
        should == [account_holder1, account_holder2]
      end
    end
  end

  describe '#add_account_holder' do
    before do
      @sut.add_account_holder(account_holder1)
    end

    it 'should contain the account holder that were added' do
      @sut.account_holder_list.length.should == 1
    end
    it 'should contain the account holder in the account holders list' do
      @sut.account_holder_list.should include(account_holder1)
    end
  end

  describe '#Sorting' do
    let(:ah_mock1) { mock(Banking::AccountHolder) }
    let(:ah_mock2) { mock(Banking::AccountHolder) }
    let(:ah_mock3) { mock(Banking::AccountHolder) }
    let(:ah_mock4) { mock(Banking::AccountHolder) }
    let(:ah_mock5) { mock(Banking::AccountHolder) }
    let(:ah_mock6) { mock(Banking::AccountHolder) }
    let(:ah_mock7) { mock(Banking::AccountHolder) }
    context 'when trying to get the top 5 account holders based on balance descending' do
      before do
        ah_mock1.stub(:get_balance => 1000)
        ah_mock2.stub(:get_balance => 2000)
        ah_mock3.stub(:get_balance => 1500)
        ah_mock4.stub(:get_balance => 100)
        ah_mock5.stub(:get_balance => 4000)
        ah_mock6.stub(:get_balance => 50)
        ah_mock7.stub(:get_balance => 10)
        @sut.add_account_holders(ah_mock1, ah_mock2, ah_mock3, ah_mock4, ah_mock5, ah_mock6, ah_mock7)
      end
      subject { @sut.get_list_of_top_five_account_holders }
      it 'should get the list of the top 5 account holders based on balance descending' do
        should == [ah_mock5, ah_mock2, ah_mock3, ah_mock1, ah_mock4]
      end
    end
    context 'when trying to get the bottom 5 account holders based on balance ascending' do
      before do
        ah_mock1.stub(:get_balance => 1000)
        ah_mock2.stub(:get_balance => 2000)
        ah_mock3.stub(:get_balance => 1500)
        ah_mock4.stub(:get_balance => 100)
        ah_mock5.stub(:get_balance => 4000)
        ah_mock6.stub(:get_balance => 5000)
        ah_mock7.stub(:get_balance => 6000)
        @sut.add_account_holders(ah_mock1, ah_mock2, ah_mock3, ah_mock4, ah_mock5, ah_mock6, ah_mock7)
      end
      subject { @sut.get_list_of_bottom_five_account_holders }
      it 'should get the list of the bottom 5 account holders based on balance ascending' do
        should == [ah_mock4, ah_mock1, ah_mock3, ah_mock2, ah_mock5]
      end
    end
  end
end



