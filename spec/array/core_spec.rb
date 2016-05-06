require 'spec_helper'

describe Array do
  describe "#add_blank_option" do
    it 'adds blank to front of array' do
      array = [["Label 1", 1], ["Label 2", 2]]
      array.add_blank_option
      array.first[0].should == ""
      array.first[1].should == 0
    end
    it 'does not add blank to front of array when doit is false' do
      array = [["Label 1", 1], ["Label 2", 2]]
      array.add_blank_option(:doit => false)
      array.first[0].should == "Label 1"
      array.first[1].should == 1
    end
    it 'handles specified label correctly' do
      array = [["Label 1", 1], ["Label 2", 2]]
      array.add_blank_option(:label => "Custom")
      array.first[0].should == "Custom"
      array.first[1].should == 0
    end
    it 'handles specified value correctly' do
      array = [["Label 1", 1], ["Label 2", 2]]
      array.add_blank_option(:value => 5)
      array.first[0].should == ""
      array.first[1].should == 5
    end
  end

  describe "#each_with_end_flag" do
    it 'works' do
      passes = []
       ["a", "b", "c"].each_with_end_flag do |item, flag|
         passes.push(item) if flag
       end
      passes.size.should == 1
    end
  end

  describe "#add_all" do
    it "adds items correctly" do
      [].add_all([1,2]).should == [1,2]
    end
    it "does not create a new array" do
      a = []
      b = a.add_all([1,2])
      a.should === b
    end
    it "flattens multidimensional array" do
      [].add_all([0,[1,2]]).should == [0,1,2]
    end
    it "does not flatten multidimensional array when option is set" do
      [].add_all([0,[1,2]], :flatten => false).should == [0,[1,2]]
    end
  end

end
