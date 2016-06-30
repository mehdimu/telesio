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

  def new
    raise 'Not Implemented'
  end

end
