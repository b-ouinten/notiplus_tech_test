# frozen_string_literal: true

module Auth0
  module User
    class Create < ::Auth0::Base
      attr_reader :email, :password

      def initialize(email, password = nil)
        @email = email&.to_s&.downcase
        @password = password
      end

      def process
        # left empty on purpose
      end
    end
  end
end
