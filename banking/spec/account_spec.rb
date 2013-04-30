require 'spec_helper.rb'

describe '#Account' do
  before do
    @sut = Banking::Account.new(100, 1000)
    @account = Banking::Account.new(500, 1000)
  end

  describe '#add_amount' do
    context 'when adding amount to an account' do
      before do
        @sut.add_amount(100)
      end

      it 'should return the new amount of the account' do
        @sut.balance.should == 200
      end
    end
    context 'when adding a negative amount to an account' do
      subject { @sut.add_amount(-100) }
      it 'should return -1' do
        should == -1
      end
    end
  end

  describe '#withdraw' do
    context 'when trying to withdraw money from the account' do
      subject { @sut.withdraw(80) }
      it 'should return the amount asked' do
        should == 80
      end
    end

    context 'when trying to withdraw money from the account' do
      before { @sut.withdraw(80) }
      it 'should decrease the amount of the account' do
        @sut.balance.should == 20
      end
    end

    context 'when trying to withdraw more money than available in the account' do
      subject { @sut.withdraw(1000) }
      it 'should return -1 if the amount if the amount of money to withdraw is greater than the account balance' do
        should == -1
      end
    end
  end

  describe '#transfer_money' do
    context "when trying to transfer money from an account to another" do
      before { @sut.transfer_money(@account, 100) }
      it 'should decrease the amount of money on the host account' do
        @sut.balance.should == 0
      end
      it 'should increase the amount of money in the account to be transfer' do
        @account.balance.should == 600
      end
    end

    context 'when trying to transfer more money than the available in the account' do
      subject { @sut.transfer_money(@account, 3000) }
      it 'should return -1 if the amount to transfer is greater than the account balance' do
        should == -1
      end
    end
  end

  describe "#get_balance" do
    before do
      @sut.add_amount(300)
    end
    context "when trying to get the balance of the account on a certain date" do
      subject { @sut.get_balance(DateTime.now) }
      it "should return the balance of the account until that date" do
        should == 400
      end

    end
  end


end