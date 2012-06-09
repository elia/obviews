require 'spec_helper'

describe 'exposure' do
  let(:controller) { ApplicationController.new }
  
  it 'can see the content' do
    visit '/'
    page.should have_content controller.send(:blog).title
    
    within '.footer' do
      page.should_not have_content('Secret!')
    end
  end
end
