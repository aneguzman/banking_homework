require 'spec_helper'

describe 'Teller' do
  before do
    @list = []
    @account = mock { Banking::Account }
    @account.stub(:get_balance => 40)
    @account.stub(:id => 1000)
    @account_holder = mock { Banking::AccountHolder }
    @account_holder.stub(:name => "Juan Pedro")
    @account_holder_wrapper_mock = mock { Banking::AccountHolderWrapper }
    @account_holder_wrapper_mock.stub(:account_holder => @account_holder)
    @account_holder_wrapper_mock.stub(:account => @account)
    @list << @account_holder_wrapper_mock
    @sut = Banking::Teller.new(@list)
  end

  describe '#get_balance_of_a_certain_date' do
    context 'when trying to get balance of an account in a certain date' do
      subject { @sut.get_balance_on_a_certain_date(@account_holder_wrapper_mock, 2012-10-11) }
      it 'should return the balance at the date asked' do
        should == 40
      end
    end
  end
end