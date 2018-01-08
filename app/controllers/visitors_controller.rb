##
class VisitorsController < ApplicationController

  get '/visitor/:id' do
    @visitor = Visitor.find_by_id(params[:id])
    ## visitor show page.
    erb :'/visitors/show'
  end
end
