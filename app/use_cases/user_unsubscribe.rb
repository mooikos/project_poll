# frozen_string_literal: true

module UseCases
  class UserUnSubscribe < Base
    def call(message:)
      from = message['from']
      user_id = from['id']

      # delete the entry in users table
      deleted = User.new.delete_if_present(id: user_id)

      # message "unsubscribed" when done
      if deleted
        send_unsubscribed_message(user_id:)
      else
        send_already_unsubscribed_message(user_id:)
      end
    end

    private

    def send_already_unsubscribed_message(user_id:)
      telegram_client.send_message(chat_id: user_id, text: "ALREADY UNSUBSCRIBED !!")
    end

    def send_unsubscribed_message(user_id:)
      telegram_client.send_message(chat_id: user_id, text: "YOU ARE UNSUBSCRIBED !!")
    end
  end
end
