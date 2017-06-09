class TwitterStatus
  require 'tweetstream'
  require 'json'
  require 'redis'

  def getStream
    $db = Redis.new
    TweetStream.configure do |config|
      config.consumer_key       = 'M7bSKmPtb5NBF9CzLvsgYQ8nJ'
      config.consumer_secret    = 'R058QukVPaEVF5R88fKNFO4hb4pxYM4z63VghkpPNWy41AdNOB'
      config.oauth_token        = '872413294010683396-lY0Dhic05wzLQwnBkBCJak3f2xBdm1f'
      config.oauth_token_secret = 'PF0dJnzWdxy49LMf64BYLFAzXRjfBJQf5fwLgQ3btClcD'
      config.auth_method        = :oauth
    end
    wordsArray =Array.new();
    EM.run do
      client = TweetStream::Client.new
      client.sample do |status|
        # The status object is a special Hash with
        # method access to its keys.
        puts "#{status.text}"

        filtered_status = status.text.gsub(/\b(?:#{ %w[to and or the a is of in].join('|') })\b/i,"")
        words = filtered_status.split(' ')
        words.each do |word|
          puts word
          wordsArray.push(word)
        end
        $db.set 'TweetWords', wordsArray.to_json
      end

      EM.add_timer(10) do
        puts "Completed 30 seconds of tweet"
        EM.stop_event_loop
        puts "list of words"
        puts JSON.parse($db.get("TweetWords"))
      end

    end


  return JSON.parse($db.get("TweetWords"))

  end

  def self.getTweetWords
    return JSON.parse($db.get("TweetWords"))
  end


end