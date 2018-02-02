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
     @visitor = Visitor.find_by_id(params[:id])
     if logged_in? && @visitor.id == session[:id]
     @visitor.city_ids = params[:cities]
     #### making it so a country is added to a profile if a pre-existing city is selected.
     @visitor.city_ids.each do |city|
       city_object = City.find_by_id(city)
       if !@visitor.countrys.include?(Country.find_by(:id => city_object.country_id))
       @visitor.countrys << Country.find_by(:id => city_object.country_id)
      end
     end

     if params[:city_name] != ""
     @city = City.find_or_create_by(:name => params[:city_name], :country_id => params[:countries])
     @city.save
      if !@visitor.cities.include?(@city)
       @visitor.cities << @city
      end
      if !@visitor.countrys.include?(Country.find_by(:id => params[:countries]))
        @visitor.countrys << Country.find_by(:id => params[:countries])
      end
      end
     @visitor.save
     redirect to "/visitor/#{@visitor.id}"
    end
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
