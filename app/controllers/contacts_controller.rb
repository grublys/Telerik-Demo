require 'prawn'
require 'json'

class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  
  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # GET /contacts/1/edit_inline
  def edit_inline
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def delay_three_seconds_and_spike_cpu
	begin
		Timeout.timeout(3) do	
			$loopCount = 100
			$index = 0
			
			while $index < $loopCount do
				100000000000.times{ (1231231232312313 * 12312312312312312312) / 
									(12873612876312873621 * 123123123123) }
				$index+=1
			end
		end
	rescue 
	end
  end
  
  # POST /contacts
  # POST /contacts.json
  def create
  
	# Uncomment the following method call when you need to demo a short delay
	# and CPU spike when saving a new contact.
	
	#delay_three_seconds_and_spike_cpu
	
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to contacts_url, notice: 'Contact was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :ok }
    end
  end

  def update_lead_type
    @contact = Contact.find(params[:id])
    @contact.lead_type = params[:lead_type]

    respond_to do |format|
      if @contact.save
        format.json { render json: @contact }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def export
    @contacts = Contact.all
    Prawn::Document.generate('contacts.pdf') do |pdf|
      @contacts.each do |contact|
        pdf.text contact.to_json
      end
    end
    send_file('contacts.pdf')
  end

  def treeview
    @contacts = Contact.all
  end
end
