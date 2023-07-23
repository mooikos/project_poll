# frozen_string_literal: true

module UseCases
  class Base
    private

    def telegram_client
      TelegramClient.new
    end
  end
end
