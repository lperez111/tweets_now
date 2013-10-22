class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)
    tweets.each do |tweet|
      self.tweets << Tweet.create(text: tweet[:text], created_at: tweet[:created_at])
    end
  end

  def tweets_stale?
    tweets = Twitter.user_timeline(self.username)
    time_lapse = Time.now - tweets.first.created_at
    time_lapse > 7 
  end
end
