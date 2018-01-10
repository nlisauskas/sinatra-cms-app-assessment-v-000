class CountrysController < ApplicationController

get '/countries' do
  erb :'/countries/countries'
  end

  get 'country/:id' do
    @country = Country.find_by(:id => params[:id])
    erb :'/countries/show'
  end

end
