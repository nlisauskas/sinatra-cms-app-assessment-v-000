require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :'index'
  end

  get '/signup' do
    if session[:visitor_id]
      redirect to '/countries'
    else
      erb :'/visitors/create_visitor'
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty?
      redirect to '/signup'
    else
      @visitor = Visitor.create(:username => params[:username], :password => params[:password])
      @visitor.country_ids = params[:countrys]
      @visitor.save
      session[:visitor_id] = @visitor.id
      redirect to "/visitor/#{@visitor.id}"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/visitor/#{session[:visitor_id]}"
    else
      erb :'/visitors/login'
    end
  end

  post '/login' do
    visitor = Visitor.find_by(:username => params[:username])
    if visitor && visitor.authenticate(params[:password])
    session[:visitor_id] = visitor.id
    redirect to "/visitor/#{visitor.id}"
    else
      redirect to "/login"
    end
  end

  get '/logout' do
    if logged_in?
    session.clear
    redirect to '/login'
    else
    redirect to '/login'
    end
  end


  helpers do
    def logged_in?
      !!current_visitor
    end

    def current_visitor
      @current_visitor ||= Visitor.find_by(id: session[:visitor_id]) if session[:visitor_id]
    end
  end

end
