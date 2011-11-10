class EventsController < ApplicationController
  before_filter :find_event, only: [ :show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
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
  
  protected
  def find_event
    @event = Event.find(params[:id])
  end
end
