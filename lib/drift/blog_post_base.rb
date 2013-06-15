module Drift
  class BlogPostBase < Drift::StaticModel
    class << self
      attr_accessor :markup_ext

      def source
        @source ||= 'db/static/blog_posts'
      end

      def markup_ext
        @markup_ext ||= 'md'
      end

      def find_by_slug(slug)
        file = all_files.detect{ |f| slug == parse_slug_from_filename(f) }

        find_by_file(file)
      end

      def parse_datetime_from_filename(filename)
        date = filename.split(/[_|\.]/)[0]
        time = filename.split(/[_|\.]/)[1]
        DateTime.parse "#{date} #{time[0..1]}:#{time[2..3]}:#{time[4..5]}"
      end

      def parse_slug_from_filename(filename)
        filename.split(/[_|\.]/)[2]
      end
    end

    attr_accessor :created_at, :slug, :content, :title, :author, :version

    def initialize(args = {})
      super
      set_attributes_from_filename(args[:file]) unless args[:file].nil?
    end

    def content
      GitHub::Markup.render(@file, @content)
    end

    private

    def set_attributes_from_filename(filename)
      self.created_at = self.class.parse_datetime_from_filename(filename)
      self.slug = self.class.parse_slug_from_filename(filename)
    end
  end
end
