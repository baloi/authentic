require 'spec_helper'

describe Caseload do
  it 'should have one or many treatments' do
    caseload = Caseload.create 
    t1 = PTTreatment.create(:description => "a PT Treatment session")
    t2 = PTTreatment.create(:description => "another PT Treatment session")
    caseload.treatments << t1
    caseload.treatments << t2
    caseload.save
 
    caseload.treatments.first.description.should == t1.description
    caseload.treatments.last.description.should == t2.description
  end
end
