class ResidentsController < ApplicationController
  # GET /residents
  # GET /residents.xml
  def index
    @residents = Resident.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @residents }
    end
  end

  # GET /residents/1
  # GET /residents/1.xml
  def show
    @resident = Resident.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resident }
    end
  end

  # GET /residents/new
  # GET /residents/new.xml
  def new
    @resident = Resident.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resident }
    end
  end

  # GET /residents/1/edit
  def edit
    @resident = Resident.find(params[:id])
  end

  # POST /residents
  # POST /residents.xml
  def create
    @resident = Resident.new(params[:resident])

    respond_to do |format|
      if @resident.save
        format.html { redirect_to(@resident, :notice => 'Resident was successfully created.') }
        format.xml  { render :xml => @resident, :status => :created, :location => @resident }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resident.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /residents/1
  # PUT /residents/1.xml
  def update
    @resident = Resident.find(params[:id])

    respond_to do |format|
      if @resident.update_attributes(params[:resident])
        format.html { redirect_to(@resident, :notice => 'Resident was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resident.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /residents/1
  # DELETE /residents/1.xml
  def destroy
    @resident = Resident.find(params[:id])
    @resident.destroy

    respond_to do |format|
      format.html { redirect_to(residents_url) }
      format.xml  { head :ok }
    end
  end
end
