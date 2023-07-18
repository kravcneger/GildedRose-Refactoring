require 'spec_helper'

describe BackStagePasses do  
  let(:calculator){ BackStagePasses.new(item)}
  
  describe "#update_quality" do
    before { calculator.update_quality }

    context "sell_in not expired" do
      let(:item){ Item.new("item",20,20) }
      it { expect(item.quality).to eq 21 }
      it { expect(item.sell_in).to eq 19 }
    end

    context "sell_in less than or equal 10" do
      let(:item){ Item.new("item",10,10) }
      it { expect(item.quality).to eq 12 }
      it { expect(item.sell_in).to eq 9 }
    end

    context "sell_in less than or equal 5" do
      let(:item){ Item.new("item",5,10) }
      it { expect(item.quality).to eq 13 }
      it { expect(item.sell_in).to eq 4 }
    end

    context "max quality" do
      let(:item){ Item.new("item",10,50) }
      it { expect(item.quality).to eq 50 }
    end
  end
  
end