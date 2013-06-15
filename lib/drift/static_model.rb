module Drift
  class StaticModel
    class << self
      attr_accessor :source

      def all
        source.present? ? fetch_all : []
      end

      def all_files
        all_files = []

        for_each_file do |file|
          all_files.push file
        end

        all_files
      end

      def find_by_file(file)
        build_from_file(file)
      end

      private

      def for_each_file(&block)
        Dir.foreach(source) do |file|
          next if file == '.' || file == '..'
          block.call(file)
        end
      end

      def fetch_all
        all_records = []

        for_each_file do |file|
          all_records.push build_from_file(file)
        end

        all_records
      end

      def build_from_file(file)
        raw_model_data = File.read("#{source}/#{file}")

        yaml_attributes = raw_model_data.scan(/((\A.+:)(.+\n)*)\s*\n\s*\n/)

        attributes = YAML::load(yaml_attributes[0][0])

        attributes[:content] = raw_model_data.partition(yaml_attributes[0][0]).last
        attributes[:file] = file

        new(attributes)
      end
    end

    def initialize(args = {})
      args.each do |k, v|
        instance_variable_set("@#{k.to_s.underscore}", v) unless v.nil?
      end
    end
  end
end
