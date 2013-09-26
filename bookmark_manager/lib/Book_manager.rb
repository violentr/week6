require 'sinatra'
require 'data_mapper'
require 'database_cleaner'

#require 'capybara/rspec'

env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost:5432/bookmark_manager_#{env}")

require './lib/link' # this needs to be done after datamapper is initialised
require './lib/tag'
# After declaring your models, you should finalise them
DataMapper.finalize
# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

DatabaseCleaner.strategy = :truncation
#DatabaseCleaner.clean #use it when ever you need to clean DB
class BookManager < Sinatra::Base #never do underscore in class names
 set :views,File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
  	@links = Link.all
  	
     erb :index
  end

  get '/tags/:text' do
	tag = Tag.first(:text =>params[:text])
    # puts tag.links.inspect
	@links = tag ? tag.links : []
	erb :index
  end

  post '/links' do
 	web_prefix ='http://'
  	url =web_prefix + params['url']
  	title =params['title']

  	tags = params['tags'].split(" ").map{|tag| Tag.new(:text => tag)}
  	#puts tags
	Link.create(:url => url, :title => title, :tags => tags)
	redirect('/')

	erb :index
end
 
  # start the server if ruby file executed directly
  run! if app_file == $0

end
