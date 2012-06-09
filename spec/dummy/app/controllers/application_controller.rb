class ApplicationController < ActionController::Base
  protect_from_forgery
  expose :blog
  
  def index
    blog.posts << post
    @private_instance_var = 'Secret!'
    expose :custom_title
  end
  
  
  private
  
  def custom_title
    'Hi World!'
  end
  
  def blog
    @blog ||= Blog.new 'Whispered Thinking.', []
  end
  
  def post
    @post ||= Post.new('post-title', 'post-body')
  end
end
