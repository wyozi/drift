drift [![Build Status](https://travis-ci.org/jpruetting/drift.png?branch=master)](https://travis-ci.org/jpruetting/drift)
=============

Drift is a static blogging engine for Rails.


Installation
=============

Include the gem in your Gemfile:

```ruby
gem 'drift'
```

Usage
=============

Create a blog post:
```ruby
rails g drift:blog_post 'Demo Blog Post'
```

The default location for blog posts is db/static/blog_posts. 
The deafult markup language is markdown.

You can change these settings by overriding the blog_post model:

app/models/drift/blog_post.rb
```ruby
module Drift
  class BlogPost < Drift::BlogPostBase
    self.source = 'public/blog/posts'
    self.markup_ext = 'textile'
  end
end
```

You can also use the model to extend functionality for blog posts:

app/models/drift/blog_post.rb
```ruby
module Drift
  class BlogPost < Drift::BlogPostBase
    belongs_to :author, :class_name => 'User'
  end
end
```

Blog post format:

```ruby
title: Title
author: Author
version: 1


Blog content starts here. Keep two blank lines between the attributes and the content.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nisi dolor, aliquam eu condimentum quis, fermentum non augue. Donec quis leo volutpat, convallis arcu at, sollicitudin purus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam placerat tempus sapien, porttitor ornare augue suscipit in. Sed auctor neque sed mauris ornare, sit amet ullamcorper ipsum commodo. Praesent et vehicula nisl. Vivamus egestas dui a tortor elementum, et lacinia mauris fringilla. Mauris vestibulum felis in libero elementum, at fermentum odio ultrices. Vivamus tempor arcu a ligula congue, sit amet venenatis elit sodales. Nam eget sem vehicula, scelerisque nisi nec, convallis nulla. Suspendisse potenti. Aenean ornare, purus a viverra pharetra, lacus velit placerat metus, vel gravida tortor leo eget urna. Nullam scelerisque auctor ante.

Sed pharetra enim tortor, rhoncus egestas eros aliquam et. Pellentesque porta est arcu, ac scelerisque tellus sodales ut. Suspendisse ullamcorper, metus a vulputate mollis, felis quam hendrerit sapien, porta interdum orci nunc nec ipsum. Nulla pulvinar ac lacus at condimentum. Curabitur a diam tristique, rhoncus magna at, adipiscing nibh. Aliquam erat volutpat. In tempor euismod metus, ac lobortis quam ullamcorper euismod. Morbi in neque facilisis, egestas nibh auctor, pretium risus.

Sed vulputate condimentum lorem, elementum venenatis massa imperdiet ut. Nulla ultricies metus in aliquet malesuada. Maecenas nisi quam, cursus sed tellus ut, posuere ultricies mauris. Morbi aliquam dignissim nisi ac euismod. Quisque vestibulum neque arcu, ac venenatis dolor tincidunt quis. Suspendisse at dolor libero. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla posuere non lorem sit amet dignissim. Nam eget justo eget mi consectetur dapibus vitae vitae mauris. Nulla vitae ullamcorper magna. In in fermentum est. In lacinia venenatis turpis, a rutrum metus laoreet a. Vivamus adipiscing vel enim eu scelerisque.
```
