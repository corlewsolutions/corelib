require 'spec_helper'

describe FalseClass do
  describe "#to_yes_no" do
    it 'converts correctly with no options' do
      false.to_yes_no.should == "No"
    end
    it 'converts correctly when if_no is set' do
      false.to_yes_no(:if_no => "no way").should == "no way"
    end
    it 'converts correctly to uppercase' do
      false.to_yes_no(:format => "Up").should == "NO"
    end
    it 'converts correctly to uppercase when if_no is set' do
      false.to_yes_no(:format => "Up", :if_no => "no way").should == "NO WAY"
    end
    it 'converts correctly to downcase' do
      false.to_yes_no(:format => "Down").should == "no"
    end
    it 'converts correctly to downcase when if_no is set' do
      false.to_yes_no(:format => "Down", :if_no => "NO WAY").should == "no way"
    end
    it 'converts correctly when format is an unsupported string' do
      false.to_yes_no(:format => "Hokie's Rules").should == "No"
    end
    it 'converts correctly when format is an unsupported string and if_no is set' do
      false.to_yes_no(:format => "Hokie's Rules", :if_no => "chuck norris").should == "Chuck norris"
    end
  end
end