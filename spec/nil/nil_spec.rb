require 'spec_helper'

describe NilClass do
  describe "#to_yes_no" do
    it 'converts correctly with no options' do
      nil.to_yes_no.should == ""
    end
    it 'converts correctly with if_nil option' do
      nil.to_yes_no(:if_nil => "Unspecified") == "Unspecified"
    end
  end
end