class LotterySourcesController < ApplicationController
  def index
    @lottery_sources = LotterySource.all
  end
  
  def new
    @lottery_sources = LotterySource.new
  end
  
  def create
    @lottery_sources = LotterySource.new(params[:lottery_source])
    @lottery_sources.save
  
    redirect_to action: :index
  end
  
  def show
    @lottery_sources = LotterySource.find(params[:id])
  end
  
  def edit
    @lottery_sources = LotterySource.find(params[:id])
  end
  
  def update
    @lottery_sources = LotterySource.find(params[:id])
    @lottery_sources.update_attributes(params[:lottery_source])
  
    redirect_to action: :show, id: @lottery_sources
  end
  
  def destroy
    @lottery_sources = LotterySource.find(params[:id])
    @lottery_sources.destroy
  
    redirect_to action: :index
  end
  
  def lottery
    list_count = LotterySource.count
    @lottery_sources = LotterySource.find(:first, offset: rand(list_count))
  end
end
