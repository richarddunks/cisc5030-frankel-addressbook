class EntriesController < ApplicationController
  include EntriesHelper

  respond_to :html

  before_filter :find_entry, only: [:show, :edit, :update]
  before_filter :build_children, only: [:new, :edit]

  def index
    respond_with(@entries = Entry.all)
  end

  def show
    respond_with(@entry)
  end

  def new
    respond_with(@entry)
  end

  def edit
    respond_with(@entry)
  end

  def create
    @entry = Entry.new(params[:entry])
    if(@entry.save)
      flash[:notice] = "Entry created"
    else
      build_children
    end
    respond_with(@entry)
  end

  def update
    flash[:notice] = "Entry #{@entry.id} updated" if @entry.update_attributes(
      params[:entry]
      )
    respond_with(@entry)
  end

  def destroy
    Entry.find(params[:id]).destroy
    redirect_to entries_url
  end

  private
  def find_entry
    @entry = Entry.find(params[:id])
  end

  def build_children
    @entry ||= Entry.new
    @entry.addresses.build
    urls do |accessor,type|
      @entry.send(accessor).build
    end
  end
end
