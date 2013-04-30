require 'spec_helper.rb'

describe 'AccountHolder' do
  before do
    account_mock = mock { Banking::Account }
    account_mock.stub(:withdraw => 20)
    account_mock.stub(:transfer_money => 'transfer')
    account_mock.stub(:balance => 100)
    @sut = Banking::AccountHolder.new(account_mock, "Aneudy")
  end

  describe '#get_balance' do
    subject { @sut.get_balance }
    it "should return the current balance of the account" do
      should == 100
    end
  end

  describe '#widraw_money' do
    context 'when trying to withdraw money from the account' do
      subject { @sut.withdraw_money(20) }
      it 'should return the money from the account' do
        should == 20
      end
    end
  end

  describe '#transfer_money' do
    context 'when trying to transfer money from one account to another' do
      subject { @sut.transfer_money_to(@account2, 110) }
      it 'should transfer money from account1 to account 2' do
        should == 'transfer'
      end
    end
  end
end
