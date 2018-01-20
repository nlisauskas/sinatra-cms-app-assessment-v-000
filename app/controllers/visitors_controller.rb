class VisitorsController < ApplicationController

   get '/visitor/:id' do
     @visitor = Visitor.find_by_id(params[:id])
     erb :'/visitors/show'
   end

   get '/visitor/:id/edit_countries' do
     @visitor = Visitor.find_by(:id => params[:id])
     if logged_in? && @visitor.id == session[:id]
     erb :'/visitors/edit_countries'
    else
      redirect to "/visitor/#{session[:id]}"
    end
   end

   patch '/visitor/:id' do
     @visitor = Visitor.find_by_id(params[:id])
     @visitor.country_ids = params[:countrys]
     @visitor.save
     redirect to "/visitor/#{@visitor.id}"
   end

   get '/visitor/:id/edit_cities' do
     @visitor = Visitor.find_by(:id => params[:id])
     if logged_in? && @visitor.id == session[:id]
     erb :'/visitors/edit_cities'
    else
      redirect to "/visitor/#{session[:id]}"
    end
   end

   patch '/visitor/:id/cities' do
     ## need to have one option for if they select an existing city and if they create a new city
     @visitor = Visitor.find_by_id(params[:id])
     @city = City.create(:name => params[:city_name])
     @city.country_id = params[:countries]
     @city.save
     @visitor.cities << @city
     @visitor.countrys << Country.find_by(:id => params[:countries])
     @visitor.save
     redirect to "/visitor/#{@visitor.id}"
   end

   get '/visitors' do
     erb :'/visitors/visitors'
   end

   delete '/visitor/:id/delete' do
     @visitor = Visitor.find_by(:id => params[:id])
     if logged_in? && @visitor.id == session[:id]
     @visitor.destroy
     session.clear
     redirect to '/signup'
    else
     redirect to '/visitors'
   end
   end
 end
