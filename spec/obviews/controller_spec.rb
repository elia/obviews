require 'spec_helper'

describe Obviews::Controller do
  let(:controller) { ApplicationController.new }
  it 'responds to #expose' do
    controller.should respond_to(:expose)
    controller.class.should respond_to(:expose)
  end
end
