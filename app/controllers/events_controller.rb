class EventsController < ApplicationController
  before_filter :find_event, only: [ :show, :edit, :update, :destroy]
  before_filter :check_user, except: [:index]
  
  def index
    if (current_user)
      @user = current_user
      @events = @user.events.all
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    @event.save
    
    redirect_to events_path
  end
  
  def show
    @page_title = @event.name
    @cats = @event.cats
    
  end
  
  def edit
    
  end
  
  def update
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event)
    else
      redirect_to edit_event_path
    end
  end
  
  def destroy
    @event.destroy
    redirect_to events_path
  end
  
  def lottery
    @event = Event.find(params[:id])
    #@cats = @event.cats.lottery(params[:quantity])
    @cats = @event.cats.lottery(1)
  end
  
  protected
  def find_event
    @event = Event.find(params[:id])
  end
  
  protected
  def check_user
    if !user_signed_in?
      redirect_to root_path
    end
  end
end
