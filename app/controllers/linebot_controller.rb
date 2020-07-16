class LinebotController < ApplicationController
  require 'line/bot' 
  protect_from_forgery :except => [:callback]
 
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
 
  def callback
    body = request.body.read
 
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end
 
    events = client.parse_events_from(body)
 
    events.each { |event|
    if event['type'] == 'follow'
      userId = event['source']['userId']
      Room.create(user_id: userId,important: false,check: false)
    end
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: event.message['text']
          }
          Message.create(text:event.message['text'],user_id: event['source']['userId'])
          # client.reply_message(event['replyToken'], message)
        end
      end
    }
 
    head :ok
  end

  def push_message
    client = Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
   } 
   message ={
    type: 'text',
    text: params[:text]
   }
                 user_id = params[:user_id]
   response = client.push_message(user_id, message)


  end


end
