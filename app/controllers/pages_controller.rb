require 'bcrypt'
BCrypt::Engine::DEFAULT_COST = 12
class PagesController < ApplicationController
  def home
  end

  def about
  end

  def myevents
    @events = current_user.events
  end 

  def joinevent
      @event = Event.find_by(join_code: params[:join_code])
      if @event  
        session[:join_code] = params[:join_code]        
        redirect_to :controller => 'events', :action => 'show', :id => @event.id
      else
        redirect_to pages_home_path
      end
  end
end
