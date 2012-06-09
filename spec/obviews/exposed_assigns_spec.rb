require 'spec_helper'

describe Obviews::ExposedAssigns do
  let(:object) { double('object', :a_method => 'a value') }
  
  it 'lazily calls methods' do
    exposed_assigns = described_class.new object, [:a_method]
    object.should_receive :a_method
    exposed_assigns[:a_method]
  end
    
  it 'returns the value' do
    exposed_assigns = described_class.new object, [:a_method]
    exposed_assigns[:a_method].should eq('a value')
  end
  
  it 'memoizes the value' do
    exposed_assigns = described_class.new object, [:a_method]
    exposed_assigns[:a_method]
    
    object.should_not_receive :a_method
    exposed_assigns[:a_method]
  end
  
  describe '#keys' do
    context 'with merged hash' do
      it 'has keys from both' do
        exposed_assigns = described_class.new object, [:a_method]
        exposed_assigns.merge! :another_method => 'another value'
        exposed_assigns.keys.should include(:another_method)
        exposed_assigns.keys.should include(:a_method)
      end
    end
  end
end
