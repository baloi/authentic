module ApplicationHelper
  def insurance_color resident
    #"yellow"
    if resident.insurance == "Med A" 
      return "FF3300" 
    elsif resident.insurance == "Med B"
      return "00CC66"
    elsif resident.insurance == "Medicaid"
      return "FF33FF"
    elsif resident.insurance == "HMO"
      return "#66CCFF"
    elsif resident.insurance == "RHMO"
      return "#66CCFF"
    elsif resident.insurance == "VA"
      return "#66CCFF"
    end
  end 

  def resident_insurace_select 
    a_tag = "<select id='resident_insurance' name='resident[insurance]'>"

    Resident.insurance_types.each do |insurance|
      selected = ''
      if insurance == @resident.insurance 
        selected = " selected='yes'"
      end
      a_tag += "<option value='#{insurance}'#{selected}>#{insurance}</option>"
    end

    a_tag += "</select>"
    a_tag
  end

  def physical_therapist_select 
    a_tag = "<select id='resident_physical_therapist_id' name='resident[physical_therapist_id]'>"

    @therapists.each do |therapist|
      selected = ''
      if @resident.id != nil
        if @resident.physical_therapist.id != nil && therapist == @resident.physical_therapist.id
          selected = " selected='yes'"
        end
      end
      a_tag += "<option value='#{therapist.id}'#{selected}>#{therapist.name}</option>"
    end

    a_tag += "</select>"
    a_tag
  end


end
