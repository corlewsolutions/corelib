require 'spec_helper'

describe Hash do
  describe "#each_with_end_flag" do
    it 'works' do
      passes = []
      [:first => "1st", :second => "2nd", :third => "3rd"].each_with_end_flag do |item, flag|
        passes.push(item) if flag
      end
      passes.size.should == 1
    end
  end

  describe "#not_empty?" do
    it "works" do
      {}.not_empty?.should == false
      {:test => "me"}.not_empty?.should == true
    end
  end
end