require 'spec_helper'

describe TrueClass do
  describe "#to_yes_no" do
    it 'converts correctly with no options' do
      true.to_yes_no.should == "Yes"
    end
    it 'converts correctly when if_yes is set' do
      true.to_yes_no(:if_yes => "yes way").should == "yes way"
    end
    it 'converts correctly to uppercase' do
      true.to_yes_no(:format => "Up").should == "YES"
    end
    it 'converts correctly to uppercase when if_yes is set' do
      true.to_yes_no(:format => "Up", :if_yes => "Yes way").should == "YES WAY"
    end
    it 'converts correctly to downcase' do
      true.to_yes_no(:format => "Down").should == "yes"
    end
    it 'converts correctly to downcase when if_yes is set' do
      true.to_yes_no(:format => "Down", :if_yes => "YES WAY").should == "yes way"
    end
    it 'converts correctly when format is an unsupported string' do
      true.to_yes_no(:format => "Hokie's Rules").should == "Yes"
    end
    it 'converts correctly when format is an unsupported string and if_yes is set' do
      true.to_yes_no(:format => "Hokie's Rules", :if_yes => "chuck norris").should == "Chuck norris"
    end
  end
end