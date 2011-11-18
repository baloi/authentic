class MagnetsController < ApplicationController
  before_filter :login_required
  def list
    @therapists = Therapist.find(:all)
    respond_to do |format|
      format.html # show_by_therapist.html.erb
    end
  end

end
