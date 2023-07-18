require 'spec_helper'

describe ConjuredCalculator do  
  let(:calculator){ ConjuredCalculator.new(item)}
  
  describe "#update_quality" do
    before { calculator.update_quality }

    context "sell_in not expired" do
      let(:item){ Item.new("item",20,20) }
      it { expect(item.quality).to eq 18 }
      it { expect(item.sell_in).to eq 19 }
    end

    context "sell_in is expired" do
      let(:item){ Item.new("item",0,20) }
      it { expect(item.quality).to eq 16 }
	  it { expect(item.sell_in).to eq -1 }
    end
  end
end