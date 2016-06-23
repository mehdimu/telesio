class ChannelsController < ApplicationController


  def list

  end

  def show
    @channel = Channel.where(:id => params[:id]).first
    redirect_to '/channels' if @channel.nil?
  end

  def index
    @channels = Channel.all
  end

end
