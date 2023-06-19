# frozen_string_literal: true

binding.pry

Thread.new do
  puts 'Starting Background Threads'
  # require_relative './notification'

  # general configs
  telegram_api_domain= 'https://api.telegram.org'
  api_token = "bot#{ENV['TELEGRAM_API_TOKEN']}"
  telegram_api_base_url = "#{telegram_api_domain}/#{api_token}"

  # get the latest messages
  # bot_updates_path = '/getUpdates'
  bot_updates_path = '/getUpdates?offset=-1'
  test_get_updates_url = "#{telegram_api_base_url}#{bot_updates_path}"
  response = RestClient.get(test_get_updates_url)
  updates = JSON.parse response.body

  users_table = DB[:users]
  updates['result'].each do |update|
    # save the users if not existing
    from = update['message']['from']
    user_id = from['id']
    matching_users = users_table.where(id: user_id)
    next if matching_users.count > 0

    user_name = from['first_name'] + from['last_name']
    users_table.insert(id: user_id, name: user_name)
  end

  while true
    sleep 5
    # Notification.new.perform

    target_chat = users_table.first[:id]
    scary_message = 'Hello Massy!!'
    test_send_message_url = "#{telegram_api_base_url}/sendMessage?chat_id=#{target_chat}&text=#{scary_message}"
    response = RestClient.get(test_send_message_url)
    puts JSON.parse response.body
  end
end
