# frozen_string_literal: true

class TelegramClient
  def get_updates(offset:)
    call(target_url: "/getUpdates?offset=#{offset}")
  end

  def send_message(chat_id:, text:)
    call(target_url: "/sendMessage?chat_id=#{chat_id}&text=#{text}")
  end

  private

  def call(target_url:)
    response = RestClient.get(telegram_api_base_url + target_url)
    JSON.parse response.body
  end

  def telegram_api_base_url
    "#{telegram_api_domain}/#{api_token}"
  end

  def telegram_api_domain
    'https://api.telegram.org'
  end

  def api_token
    "bot#{ENV['TELEGRAM_API_TOKEN']}"
  end
end
