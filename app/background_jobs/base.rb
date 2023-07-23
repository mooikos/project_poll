# frozen_string_literal: true

Thread.new do
  puts 'Starting Background Threads'

  telegram_client = TelegramClient.new

  # FIXME: this will start from the latest "unprocessed", it might cause troubles sometimes
  latest_processed_update_id = 0
  while true
    # fetch all updates
    updates = telegram_client.get_updates(offset: latest_processed_update_id + 1)

    updates['result'].each do |update|
      puts "\nChecking Update:"
      puts JSON.pretty_generate update

      message = update['message'] || update['edited_message']
      chat_type = message['chat']['type']
      text = message['text']
      # call different classes based on the type of update
      if chat_type == 'private'
        # FIXME: potentially call a "parent private chats" class/module
        if text == '/subscribe'
          UseCases::UserSubscribe.new.call(message:)
        elsif text == '/unsubscribe'
          UseCases::UserUnSubscribe.new.call(message:)
        else
          puts "WARNING: unprocessable text:\n#{update}"
        end
      else
        puts "WARNING: unprocessable chat type:\n#{update}"
      end

      latest_processed_update_id = update['update_id']
    end

    telegram_client.send_message(chat_id: 876996959, text: "I am waiting ..")

    sleep 5
  end
end
