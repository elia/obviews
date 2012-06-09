require 'spec_helper'

describe 'exposure' do
  it 'loads the modules' do
    ActionView::Base.ancestors.should include(Obviews::View)
    ActionController::Base.ancestors.should include(Obviews::Controller)
  end
  
  let(:controller) { ApplicationController.new }
  
  it 'can see the content' do
    visit '/'
    page.should have_content controller.send(:blog).title
    
    within '.footer' do
      page.should_not have_content('Secret!')
    end
  end
end
