class AddressesController < ApplicationController
  respond_to :html

  before_filter -> { @entry = Entry.find(params[:entry_id]) }

  def index
    respond_with(@addresses = @entry.addresses)
  end

  def show
    respond_with(@address = @entry.addresses.find(params[:id]))
  end

  def new
    respond_with(@address = @entry.addresses.build)
  end

  def edit
    respond_with(@address = @entry.addresses.find(params[:id]))
  end

  def create
    @address = @entry.addresses.build(params[:address])

    flash[:notice] = "Address created" if @address.save
    respond_with(@entry, @address)
  end

  def update
    @address = @entry.addresses.find(params[:id])
    flash[:notice] = "Address #{@address.id} updated" if @address.update_attributes(
      params[:address]
      )
    respond_with(@entry, @address)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    redirect_to entry_addresses_url(@entry)
  end
end
