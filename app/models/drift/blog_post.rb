module Drift
  class BlogPost < Drift::StaticModel
    self.source = 'db/static/blog_posts'

    attr_accessor :title, :date, :content, :slug, :author

    def self.find_by_slug(slug)
      file = self.all_files.detect do |f|
        slug == parse_slug_from_filename(f)
      end

      find_by_file(file)
    end

    def initialize(args)
      super
      set_attributes_from_filename args[:file]
    end

    def content
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      markdown.render(@content)
    end

    private

    def self.parse_date_from_filename(filename)
      Date.parse filename.split(/[_|\.]/)[0]
    end

    def self.parse_slug_from_filename(filename)
      filename.split(/[_|\.]/)[1]
    end

    def set_attributes_from_filename(filename)
      self.date = self.class.parse_date_from_filename(filename)
      self.slug = self.class.parse_slug_from_filename(filename)
    end

  end
end
