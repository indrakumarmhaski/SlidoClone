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
        redirect_to @event
      else
        redirect_to pages_home_path
      end
  end
end
