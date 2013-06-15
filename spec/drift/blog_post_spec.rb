require_relative '../spec_helper'
 
module Drift
  describe BlogPost do
    before :each do
      @datetime = DateTime.new(2013, 05, 14, 14, 20, 30) 
      @slug = 'test-blog-post'
      @file = "#{@datetime.year}-#{@datetime.month}-#{@datetime.day}_#{@datetime.hour}#{@datetime.min}#{@datetime.sec}_#{@slug}.textile"
      @blog_post = BlogPost.new(:file => @file)
    end

    it "should have a default source" do
      BlogPost.source.length.should be > 0
    end

    it "should have a default markup_ext" do
      BlogPost.markup_ext.length.should be > 0
    end

    it "should parse datetime from filename" do
      BlogPost.parse_datetime_from_filename(@file).should eq @datetime
    end

    it "should parse slug from filename" do
      BlogPost.parse_slug_from_filename(@file).should eq @slug
    end

    it "should derive created_at from filename" do
      @blog_post.created_at.should eq @datetime
    end

    it "should derive slug from filename" do
      @blog_post.slug.should eq @slug
    end
  end
end
