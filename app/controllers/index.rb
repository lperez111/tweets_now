get '/' do
	erb :index
end


post '/hey' do
	@tweet = params[:my_tweet]
	Twitter.update(params[:my_tweet])
	if request.xhr?
		erb :tweets, layout: false
	else
		erb :index
	end
end
