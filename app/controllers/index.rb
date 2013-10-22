
# get '/:username' do
#   @user = Twitter.user(params[:username])
#   # if @user.tweets.empty?
#   #   User#fetch_tweets! should make an API call
#   #   and populate the tweets table
    
#   #   Future requests should read from the tweets table 
#   #   instead of making an API call
#   #   @user.fetch_tweets!
#   # end

#   @tweets = Twitter.user_timeline(params[:username], count: 10)
#   erb :index
# end


get '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  if  @user.tweets.empty? || @user.tweets_stale?
      @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
  erb :index
end
