require 'bank_account'

describe Bank_Account do
  it "has an initial balance of zero" do

    expect(subject.balance).to eq 0
  end
end  
