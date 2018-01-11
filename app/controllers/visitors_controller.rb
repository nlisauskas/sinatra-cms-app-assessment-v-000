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

   get '/visitor/:id/edit_drinks' do
     @visitor = Visitor.find_by(:id => params[:id])
     if logged_in? && @visitor.id == session[:id]
     erb :'/visitors/edit_drinks'
    else
      redirect to "/visitor/#{session[:id]}"
    end
   end

   patch '/visitor/:id/drinks' do
     @visitor = Visitor.find_by_id(params[:id])
     countrys = @visitor.country_ids

     #iterate over countries, find or create a drink, assign drink to that country and user

     drinks = Beverage.find_or_create_by(:name => params[:drink_name])
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
