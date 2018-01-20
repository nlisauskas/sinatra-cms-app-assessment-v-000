
class CitiesController < ApplicationController

  get '/cities/new' do
    erb :'/cities/new'
  end

  post '/cities/cities' do
    @city = City.create(:name => params[:city_name])
    @country = Country.find_by_id(params[:countrys])
    @city.country_id = @country.id
    @city.save
    redirect to "/cities/#{@city.id}"
  end

  get '/cities/:id' do
    @city = City.find_by_id(params[:id])
    @country = Country.find_by(:id => @city.country_id)
    erb :'/cities/show'
  end
end
