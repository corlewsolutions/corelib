require 'spec_helper'

describe Array do
	describe "#to_yes_no" do
    it "converts correctly" do
      [false, true].to_yes_no.should == ["No", "Yes"]
      [1, 0].to_yes_no.should == ["Yes", "No"]
      ["false", "t"].to_yes_no.should == ["No", "Yes"]
    end
    it "converts correctly with options" do
      #This only tests that the options array is correctly passed along
      #All the various options are tested in other tests
      [false, true].to_yes_no(:format => "Up").should == ["NO", "YES"]
    end
  end
  describe "#sum" do
		it 'sums correctly with all positive or all negative numbers' do
			[0, 1,2,3,10,100, 5].sum.should == 121
			[0, -1,-2,-3, -10, -100, -6].sum.should == -122
		end
		it 'sums correctly with letters & numbers in loose mode' do
			[0, "a","should be 0","", nil, 3, 9].sum({:strict => false}).should == 12
		end
		it 'throws an error with letters & numbers in strict mode' do
			lambda {[0, "a","should be 0","", nil, 3, 9].sum({:strict => true})}.should raise_error TypeError
		end
  end

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

  describe "#not_empty?" do
    it "works" do
      [].not_empty?.should == false
      [1].not_empty?.should == true
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