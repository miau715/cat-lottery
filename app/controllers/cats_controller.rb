# encoding: utf-8
class CatsController < ApplicationController
  before_filter :find_cat, only: [ :show, :edit, :update, :destroy]
  
  def index
    @cats = Cat.all
  end
  
  def new
    @cat = Cat.new
  end
  
  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      flash[:notice] = "成功加入"
      redirect_to cats_url
    else
      render action: :new
    end
  end
  
  def show
    @page_title = @cat.name
  end
  
  def edit
  end
  
  def update
    if @cat.update_attributes(params[:cat])
      flash[:notice] = "成功更新"
      redirect_to cat_url(@cat)
    else
      render :action => :edit
    end
  end
  
  def destroy
    flash[:alert] = "成功刪除"
    @cat.destroy
    redirect_to cats_url
  end
  
  def lottery
    #list_count = Cat.count
    quantity = 3
    @cats = Cat.lottery(quantity)
    #@cats = Cat.order('random()').limit(quantity)
  end
  
  protected
  def find_cat
    @cat = Cat.find(params[:id])
  end
end
