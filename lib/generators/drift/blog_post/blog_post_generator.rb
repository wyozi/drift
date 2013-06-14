module Drift
  class BlogPostGenerator < Rails::Generators::Base
    desc "Creates blog post file: #{Drift::BlogPost.source}/YEAR-MONTH-DAY_TIME_TITLE.#{Drift::BlogPost.markup_ext}"

    source_root File.expand_path('../templates', __FILE__)

    argument :title, :type => :string
    argument :markup_ext, :type => :string, :default => Drift::BlogPost.markup_ext

    def generate_blog_post
      template 'blog_post.erb', "#{source}/#{filename}"
    end

    private

    def filename
      "#{date}_#{time}_#{title.parameterize}.#{markup_ext}"
    end

    def date
      Time.now.strftime('%Y-%m-%d')
    end

    def time
      Time.now.strftime('%H%M%S')
    end

    def source
      Drift::BlogPost.source
    end

  end
end
