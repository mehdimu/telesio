class StreamsController < ApplicationController


  def update
    params.permit!
    @stream = Stream.find(params[:id])
    @stream.update(params[:stream])
    flash[:success] = 'Update successful'
    redirect_to controller: 'channels', action: 'edit'
  end

  def create
    params.permit!
    @channel = Channel.find(params[:channel_id])
    @stream = @channel.streams.new(params[:stream])
    @stream.live = true
    if @stream.save
      flash[:success] = "Stream saved"
      redirect_to controller: 'channels', action: 'edit', id: @stream.channel_id
    else
      flash[:warn] = "Stream did not save"
      redirect_to controller: 'channels', action: 'edit', id: @stream.channel_id
    end
  end

end
