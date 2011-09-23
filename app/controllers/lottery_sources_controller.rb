# encoding: utf-8
class LotterySourcesController < ApplicationController
  before_filter :find_lottery_source, only: [ :show, :edit, :update, :destroy]
  
  def index
    @lottery_sources = LotterySource.all
  end
  
  def new
    @lottery_sources = LotterySource.new
  end
  
  def create
    @lottery_sources = LotterySource.new(params[:lottery_source])
    flash[:notice] = "成功加入"
    if @lottery_sources.save
      redirect_to action: :index
    else
      render action: :new
    end
  end
  
  def show
    @page_title = @lottery_sources.name
  end
  
  def edit
  end
  
  def update
    flash[:notice] = "成功更新"
    if @lottery_sources.update_attributes(params[:lottery_source])
      redirect_to action: :show, id: @lottery_sources
    else
      render :action => :edit
    end
  end
  
  def destroy
    flash[:alert] = "成功刪除"
    @lottery_sources.destroy
    redirect_to action: :index
  end
  
  def lottery
    list_count = LotterySource.count
    @lottery_sources = LotterySource.find(:first, offset: rand(list_count))
  end
  
  protected
  def find_lottery_source
    @lottery_sources = LotterySource.find(params[:id])
  end
end
