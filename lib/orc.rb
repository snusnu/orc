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
    def self.success(object)
      Success.new(object)
    end

    # Create a result indicating failure
    #
    # @param [Object] status
    #   an arbitrary status description (symbol)
    #
    # @param [Object] context
    #   context information associated with the failure
    #
    # @return [Success]
    def self.failure(status, context)
      Failure.new(status, context)
    end

    include AbstractType

    abstract_method :success?
    abstract_method :status

    # Result object indicating success along with associated data
    class Success < self
      include Concord::Public.new(:object)

      # Indicate success
      #
      # @return [true]
      def success?
        true
      end

      # Status description
      #
      # @return [:success]
      def status
        :success
      end
    end # Success

    # Result object indicating failure along with status and context
    class Failure < self
      include Concord::Public.new(:status, :context)

      # Indicate success
      #
      # @return [false]
      def success?
        false
      end
    end # Failure
  end # Result
end # Orc
