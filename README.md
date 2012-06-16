# Obviews




## Example

In the controller

```ruby
class PostsController < ApplicationController
  expose :blog, :posts
  
  def index
  end
  
  def show
    expose post: posts.first
  end
  
  private
  
  def blog
    @blog ||= Blog.first
  end
  
  def posts
    blog.posts
  end
end
```


In the views:

```haml
-# views/posts/index.html.haml
%h1= blog.title
= render posts

-# views/posts/show.html.haml
%h1= blog.title
= render post

-# views/posts/_post.html.haml
.post
  %h2= post.title
  %p= post.body
```



This project rocks and uses MIT-LICENSE.