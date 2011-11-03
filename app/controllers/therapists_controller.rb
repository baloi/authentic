class TherapistsController < ApplicationController
  # GET /therapists
  # GET /therapists.xml
  before_filter :login_required
  def index
    list
    #render :action => 'list'
  end

  before_filter :login_required
  def list
    @therapists = Therapist.all

    respond_to do |format|
      format.html # index.html.erb
    #  format.xml  { render :xml => @therapists }
    end
  end

  # GET /therapists/1
  # GET /therapists/1.xml
  before_filter :login_required
  def show
    @therapist = Therapist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @therapist }
    end
  end

  # GET /therapists/new
  # GET /therapists/new.xml
  before_filter :login_required
  def new
    @therapist = Therapist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @therapist }
    end
  end

  # GET /therapists/1/edit
  before_filter :login_required
  def edit
    @therapist = Therapist.find(params[:id])
  end

  # POST /therapists
  # POST /therapists.xml
  before_filter :login_required
  def create
    @therapist = create_therapist_from_params(params[:therapist][:type], 
                  params[:therapist])

    if @therapist.save
      flash[:notice] = 'Therapist was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end

    respond_to do |format|
      if @therapist.save
        format.html { redirect_to(@therapist, :notice => 'Therapist was successfully created.') }
        format.xml  { render :xml => @therapist, :status => :created, :location => @therapist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @therapist.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /therapists/1
  # PUT /therapists/1.xml
  before_filter :login_required
  def update
    @therapist = Therapist.find(params[:id])

    respond_to do |format|
      if @therapist.update_attributes(params[:therapist])
        format.html { redirect_to(@therapist, :notice => 'Therapist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @therapist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /therapists/1
  # DELETE /therapists/1.xml
  before_filter :login_required
  def destroy
    @therapist = Therapist.find(params[:id])
    @therapist.destroy

    respond_to do |format|
      format.html { redirect_to(therapists_url) }
      format.xml  { head :ok }
    end
  end
end
