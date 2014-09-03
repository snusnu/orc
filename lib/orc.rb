# encoding: utf-8

require 'concord'
require 'abstract_type'

# Operation result class
module Orc

  # Abstract base class for a result returned from some computation
  class Result

    # Create a result indicating success
    #
    # @param [Object] object
    #   arbitrary data associated with the result
    #
    # @return [Success]
    def self.success(object, status = :success)
      Success.new(object, status)
    end

    # Create a result indicating failure
    #
    # @param [Object] object
    #   context information associated with the failure
    #
    # @param [Object] status
    #   an optional, arbitrary status description (symbol)
    #
    # @return [Success]
    def self.failure(object, status = :failure)
      Failure.new(object, status)
    end

    include Concord::Public.new(:object, :status)
    include AbstractType

    abstract_method :success?

    alias_method :output, :object
    alias_method :data,   :object

    def failure?
      !success?
    end

    def update
      self.class.new(yield(object), status)
    end

    # Result object indicating success along with associated data
    class Success < self

      # Indicate success
      #
      # @return [true]
      def success?
        true
      end
    end # Success

    # Result object indicating failure along with status and context
    class Failure < self

      # Indicate success
      #
      # @return [false]
      def success?
        false
      end
    end # Failure
  end # Result
end # Orc
