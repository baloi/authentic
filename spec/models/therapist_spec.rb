require 'spec_helper'

describe Therapist do
  it "should have residents" do
    therapist = PhysicalTherapist.create(:name => "baloi")
    n1 = "Barka, Tanya"
    n2 = "Puwa, Lega"
    r1 = Resident.create(:name => n1)
    r2 = Resident.create(:name => n2) 

    therapist.residents << r1
    therapist.residents << r2
    therapist.save.should == true
    
    therapist.residents.first.name.should == n1
    therapist.residents.last.name.should == n2
  end

  it "should either be a PhysicalTherapist or OccupationalTherapist" do
    pt = PhysicalTherapist.create(:name => "Pasyalta, Luna")
    
    pt.class.should == PhysicalTherapist
    #puts "pt type == >>>#{pt.type}<<<"
    #puts "pt class == >>>#{pt.class}<<<"
  end

  it "should have one or more treatments" do
    therapist_name = "bal"
    therapist = PhysicalTherapist.create(:name => therapist_name)
    treatment_description = "just a PT Treatment session"
    treatment = PTTreatment.create(:description => treatment_description)
    therapist.treatments << treatment

    therapist.treatments.first.description.should == treatment_description 
  end
end
