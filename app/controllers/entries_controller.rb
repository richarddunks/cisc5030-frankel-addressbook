class EntriesController < ApplicationController
  respond_to :html

  def index
    respond_with(@entries = Entry.all)
  end

  def show
    respond_with(@entry = Entry.find(params[:id]))
  end

  def new
    respond_with(@entry = Entry.new)
  end

  def edit
    respond_with(@entry = Entry.find(params[:id]))
  end

  def create
    @entry = Entry.new(params[:entry])
    flash[:notice]  = "Entry created"if @entry.save
    respond_with(@entry)
  end

  def update
    @entry = Entry.find(params[:id])
    flash[:notice] = "Entry #{@entry.id} updated" if @entry.update_attributes(
      params[:entry]
      )
    respond_with(@entry)
  end

  def destroy
    Entry.find(params[:id]).destroy
    redirect_to entries_url
  end
end
