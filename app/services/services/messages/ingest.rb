# frozen_string_literal: true

module Services
  module Messages
    class Ingest
      def call(message)
        "Services::Messages::Ingest::#{message['Type']}".classify.constantize.new.call(message)
      end

      class SpamNotification
        def call(message)
          SpamReport.with(email: message['Email']).deliver('')
        end
      end

      class HardBounce
        def call(message); end
      end
    end
  end
end
