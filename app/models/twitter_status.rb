class TwitterStatus
  require 'tweetstream'

  def getStream
    # require File.join(File.dirname(__FILE__), 'tweet_store')

    # USERNAME = "my_username"  # Replace with your Twitter user
    # PASSWORD = "my_password"  # and your Twitter password
    # STORE = TweetStore.new

    TweetStream.configure do |config|
      config.consumer_key       = 'M7bSKmPtb5NBF9CzLvsgYQ8nJ'
      config.consumer_secret    = 'R058QukVPaEVF5R88fKNFO4hb4pxYM4z63VghkpPNWy41AdNOB'
      config.oauth_token        = '872413294010683396-lY0Dhic05wzLQwnBkBCJak3f2xBdm1f'
      config.oauth_token_secret = 'PF0dJnzWdxy49LMf64BYLFAzXRjfBJQf5fwLgQ3btClcD'
      config.auth_method        = :oauth
    end

    # This will pull a sample of all tweets based on
    # your Twitter account's Streaming API role.
    TweetStream::Client.new.sample do |status|
      # The status object is a special Hash with
      # method access to its keys.
      puts "#{status.text}"
    end

  end

end