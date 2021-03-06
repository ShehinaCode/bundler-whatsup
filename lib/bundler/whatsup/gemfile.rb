require 'bundler'

module Bundler
  module Whatsup
    # Works with dependencies and specs described in Gemfile
    class Gemfile
      attr_accessor :specs, :dependencies

      def initialize
        b = Bundler.load
        @specs = b.specs.sort_by(&:name)
        @dependencies = b.dependencies.sort_by(&:name)
      end

      # Returns current version of given gem if it is installed, or nil
      #
      # @param gem [String] name of gem
      # @return [String|nil] version of gem
      def version_of(gem)
        specs_versions[gem.to_sym]
      end

      # Returns Hash: spec_name=>version
      #
      # @return [Hash]
      def specs_versions
        specs_versions = {}
        specs.map do |spec|
          specs_versions[spec.name.to_sym] = spec.version.to_s
        end

        specs_versions
      end

      # Returns Hash: dependency_name=>version
      #
      # @return [Hash]
      def dependencies_versions
        dependencies_versions = {}
        dependencies.each do |dependency|
          dependencies_versions[dependency.name.to_sym] = specs_versions[dependency.name.to_sym]
        end

        dependencies_versions
      end
    end
  end
end

