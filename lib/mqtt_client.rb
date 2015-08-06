require 'mqtt'

module MqttClient
  # Publish messages on a mqtt server.
  #
  # @param server [Hash] with destination, user name and password
  # @param message [Hash] for humans and machines with path and level
  def self.send_message(server, message)
    MQTT::Client.connect(
      remote_host: server[:dest],
      username:    server[:user],
      password:    server[:password]
    ) do |client|
      if  ENV['RAILS_ENV'] == 'development'
        puts "push to irc path #{message[:humans][:path]}: "\
             "#{message[:humans][:level]}"\
             "#{message[:humans][:text]}\n\n"

        puts "#{{msg: message[:humans][:text], level: message[:humans][:level]}.to_json}"
      else
        # for humanes
        client.publish("#{message[:humans][:path]}",
                       {msg: message[:humans][:text],
                         level: message[:humans][:level]}.to_json)
        # for machines
        client.publish("#{message[:machines][:path]}",
                       {msg: message[:humans][:text],
                         level: message[:humans][:level]}.to_json)
      end
    end
  end
end
