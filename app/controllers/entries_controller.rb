class EntriesController < ApplicationController
  include EntriesHelper

  respond_to :html

  before_filter :find_entry,     only: [:show, :edit, :update]
  before_filter :build_children, only: [:new, :edit]
  before_filter :get_entries

  def index
    respond_with(@entries)
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
      flash_notice('created')
    else
      build_children
    end
    respond_with(@entry)
  end

  def update
    flash_notice('updated') if @entry.update_attributes(
      params[:entry]
      )
    respond_with(@entry)
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash_notice('deleted')
    redirect_to entries_url
  end

  private
  def get_entries
    criteria =
      if params[:search]
        param = "#{params[:search].downcase}%"
        ["lower(last_name) like ? or lower(first_name) like ?", param, param]
      else
        ['substr(last_name,1,1) = ?', params[:initial]||'A']
      end

    @entries = Entry.where(criteria).order('last_name, first_name')
  end

  def find_entry
    @entry = Entry.find(params[:id])
    params[:initial] = @entry.last_name[0]
  end

  def flash_notice(msg)
    flash[:notice] = "#{@entry.full_name} #{msg}"
  end

  def build_children
    @entry ||= Entry.new
    @entry.class.reflect_on_all_associations.find_all do |a|
        a.collection?
    end.collect(&:name).each do |attr|
      @entry.send(attr).build
    end
  end
end
