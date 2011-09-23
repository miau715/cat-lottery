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
  
    redirect_to :action => :index
  end
  
end
