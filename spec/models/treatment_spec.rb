require 'spec_helper'

describe Treatment do
  it "should belong to a therapist" do
    therapist_name = "bal"
    therapist = PhysicalTherapist.create(:name => therapist_name)
    treatment = PTTreatment.create(:description => "just a PT Treatment session")
    treatment.therapist = therapist 

    treatment.therapist.name.should == therapist_name 
  end

  it "should belong to a resident" do
    resident_name = "Cat, Chloe"
    resident = Resident.create(:name => resident_name)

    treatment = PTTreatment.create(:description => "just a PT Treatment session")
    treatment.resident = resident

    treatment.save

    t = Treatment.find(:first)

    t.resident.name.should == resident_name 
    
  end
end
