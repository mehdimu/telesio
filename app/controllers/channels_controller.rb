class ChannelsController < ApplicationController


  def list
  end

  def show
    @channel = Channel.where(:id => params[:id]).first
    # get first live stream for that channel, and prefer m3u8 over embed
    streams = @channel.live_streams
    m3u8_stream = streams.where(:source => 'm3u8').first
    embed_stream = streams.where(:source => 'embed').first
    @stream = m3u8_stream.nil? ? embed_stream : m3u8_stream
    # redirect to channels if channel is deleted
    flash[:warn] = "Channel is deleted" if @channel.nil? || @channel.deleted
    redirect_to '/channels' if @channel.nil? || @channel.deleted
  end

  def index
    @channels = Channel.active.all
  end

  def create
    params.permit!
    @channel = Channel.new(params[:channel])
    if @channel.save
      flash[:success] = "Channel saved with name: #{@channel.name}"
      redirect_to '/channels'
    else
      flash[:warn] = "Channel did not save! :("
      redirect_to '/channels'
    end
  end

  def destroy
    params.permit!
    @channel = Channel.find(params[:id])
    @channel.mark_as_deleted
    flash[:success] = "Deleted channel #{@channel.name}"
    redirect_to '/channels'
  end

end
