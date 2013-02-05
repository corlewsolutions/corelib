require 'spec_helper'

describe Array do
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
end