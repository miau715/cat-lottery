# encoding: utf-8
class LotterySourcesController < ApplicationController
  before_filter :find_lottery_source, only: [ :show, :edit, :update, :destroy]
  
  def index
    @lottery_sources = LotterySource.all
  end
  
  def new
    @lottery_source = LotterySource.new
  end
  
  def create
    @lottery_source = LotterySource.new(params[:lottery_source])
    flash[:notice] = "成功加入"
    if @lottery_source.save
      redirect_to lottery_sources_url
    else
      render action: :new
    end
  end
  
  def show
    @page_title = @lottery_source.name
  end
  
  def edit
  end
  
  def update
    flash[:notice] = "成功更新"
    if @lottery_source.update_attributes(params[:lottery_source])
      redirect_to lottery_source_url(@lottery_source)
    else
      render :action => :edit
    end
  end
  
  def destroy
    flash[:alert] = "成功刪除"
    @lottery_source.destroy
    redirect_to lottery_sources_url
  end
  
  def lottery
    list_count = LotterySource.count
    @lottery_source = LotterySource.find(:first, offset: rand(list_count))
  end
  
  protected
  def find_lottery_source
    @lottery_source = LotterySource.find(params[:id])
  end
end
