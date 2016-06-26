class ChannelsController < ApplicationController


  def list

  end

  def show
    @channel = Channel.where(:id => params[:id]).first
    # get first live stream for that channel
    @stream = Stream.where(:channel_id => @channel.id).where(:live => true).first
    redirect_to '/channels' if @channel.nil?
  end

  def index
    @channels = Channel.all
  end

end
