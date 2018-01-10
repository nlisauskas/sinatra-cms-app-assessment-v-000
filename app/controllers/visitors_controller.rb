class VisitorsController < ApplicationController

   get '/visitor/:id' do
     @visitor = Visitor.find_by_id(params[:id])
     erb :'/visitors/show'
   end

   get '/visitor/:id/edit' do
#     if session[:visitor_id] == params[:id]
     @visitor = Visitor.find_by_id(params[:id])
     erb :'/visitors/edit'
#    else
#      redirect to "/visitor/#{session[:visitor_id]}"
#    end
   end

   patch '/visitor/:id' do
     @visitor = Visitor.find_by_id(params[:id])
     @visitor.country_ids = params[:countrys]
     @visitor.save
     redirect to "/visitor/#{@visitor.id}"
   end

   get '/visitors' do
     erb :'/visitors/visitors'
   end

   delete '/visitor/:id/delete' do
     @visitor = Visitor.find_by_id(params[:id])
     @visitor.destroy
     session.clear
     redirect to '/signup'
   end
 end
