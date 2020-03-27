
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles' do
    
    @articles = Article.all
    
    erb :index
  end

  get '/articles/new' do
    
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  

  
  post '/articles' do
    user_title = params[:title]
    user_content = params[:content]
    
    Article.create(:title => user_title, :content => user_content)
    
    redirect "/articles/#{Article.all.last.id}"
    
    
  end
  
  
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/models/:id' do
    @article = Article.find(params[:id])
    @article.name = params[:name]
    @article.content = params[:content]
    @article.save
    
    redirect "/articles/#{params[:id]}"
  end
  
  
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect "/articles"
  end

end
