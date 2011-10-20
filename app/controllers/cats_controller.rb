# encoding: utf-8
class CatsController < ApplicationController
  
  def index
    @cats = Cat.all
    
    @event = Event.find(params[:event_id])
    redirect_to event_path(@board)
  end
  
  def new
    @event = Event.find(params[:event_id])
    @cat = @event.cats.build
  end
  
  def create
    @event = Event.find(params[:event_id])
    @cat = @event.cats.build(params[:cat])
    
    if @cat.save
      flash[:notice] = "成功加入"
      redirect_to event_cat_path(@event, @cat)
    else
      redirect_to new_event_cat_url
    end
  end
  
  def show
    @event = Event.find(params[:event_id])
    @cat = @event.cats.find(params[:id])
    @page_title = @cat.name
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @cat = @event.cats.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:event_id])
    @cat = @event.cats.find(params[:id])
    
    if @cat.update_attributes(params[:cat])
      flash[:notice] = "成功更新"
      redirect_to event_cat_path(@event,@cat)
    else
      redirect_to edit_event_cat_url
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @cat = @event.cats.find(params[:id])
    flash[:alert] = "成功刪除"
    @cat.destroy
    redirect_to event_path(@event)
  end
  
  def lottery
    #list_count = Cat.count
    @cats = Cat.lottery(params[:quantity])
  end
  
end
