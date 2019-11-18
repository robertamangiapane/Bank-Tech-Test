require 'bank_account'

describe Bank_Account do
  it "has an initial balance of zero" do

    expect(subject.balance).to eq 0
  end

  describe "#print_balance" do
    it "print the balance" do
      expect(subject.print_balance).to eq 0
    end
    
    it "print the updated balance" do
      subject.balance = 10
      expect(subject.print_balance).to eq 10
    end
  end
end
