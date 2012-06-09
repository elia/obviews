require 'spec_helper'

describe Obviews::Controller do
end

describe Obviews::Controller::ExposedAssigns do
  let(:object) { double('object') }
  it 'lazily calls methods' do
    exposed_assigns = described_class.new object, [:a_method]
      
    object.should_receive :a_method
    exposed_assigns[:a_method]
  end
    
  it 'returns the value' do
    object.stub(:a_method => 'a value')
    exposed_assigns = described_class.new object, [:a_method]
    exposed_assigns[:a_method].should eq('a value')
  end
  
  it 'memoizes the value' do
    object.stub(:a_method)
    exposed_assigns = described_class.new object, [:a_method]
    exposed_assigns[:a_method]
    
    object.should_not_receive :a_method
    exposed_assigns[:a_method]
  end
end

