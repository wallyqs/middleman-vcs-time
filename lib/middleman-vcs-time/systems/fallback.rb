module Middleman
  module VCSTime
    # Interface to filesystem metadata
    class Fallback
      # Extensions to sitemap resources
      module ResourceIncludes
        def mtime
          source_file ? source_file[:full_path].mtime : Time.now
        end
      end

      def self.load
        Middleman::Sitemap::Resource.class_eval do
          include ResourceIncludes
        end
      end
    end
  end
end
