module Drift
  class BlogPost < Drift::StaticModel
    self.source = 'db/static/blog_posts'

    attr_accessor :title, :date, :content, :slug, :author

    def self.find_by_slug(slug)
      file = self.all_files.detect do |f|
        slug == parse_slug_from_file(f)
      end

      find_by_file(file)
    end

    def initialize(args)
      super
      set_attributes_from_file args[:file]
    end

    def content
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      markdown.render(@content)
    end

    private

    def self.parse_date_from_file(file)
      Date.parse file.split(/[_|\.]/)[0]
    end

    def self.parse_slug_from_file(file)
      file.split(/[_|\.]/)[1]
    end

    def set_attributes_from_file(file)
      self.date = self.class.parse_date_from_file(file)
      self.slug = self.class.parse_slug_from_file(file)
    end

  end
end
