class CountrysController < ApplicationController

get '/countries/' do
  @visitor = Visitor.find_by_id(session[:visitor_id])
  erb :'/countries/countries'
  end

end
