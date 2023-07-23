# frozen_string_literal: true

module UseCases
  class UserSubscribe < Base
    def call(message:)
      from = message['from']
      user_id = from['id']

      # message "already subscribed" if already
      matching_users = User.new.where(id: user_id)
      if matching_users.count > 0
        send_already_subscribed_message(user_id:)
        return
      end

      # create an entry in users table
      user_name = "#{from['first_name']} #{from['last_name']}"
      User.new.save(id: user_id, name: user_name)

      # message "subscribed" when done
      send_subscribed_message(user_id:)
    end

    private

    def send_already_subscribed_message(user_id:)
      telegram_client.send_message(chat_id: user_id, text: "ALREADY SUBSCRIBED !!")
    end

    def send_subscribed_message(user_id:)
      telegram_client.send_message(chat_id: user_id, text: "YOU ARE SUBSCRIBED !!")
    end
  end
end
