require "ruboty/qanda/actions/qanda"

module Ruboty
  module Handlers
    class Qanda < Base
      on /tell( me)? (?<keyword>.+)/, name: "qanda", description: "Answer your question"
      def qanda(message)
        Ruboty::Qanda::Actions::Qanda.new(message).call
      end
    end
  end
end
