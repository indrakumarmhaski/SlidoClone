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
        redirect_to :controller => 'events', :action => 'show', :id => @event.id, :join_code => BCrypt::Password.create(params[:join_code])
      else
        redirect_to pages_home_path
      end
  end
end
