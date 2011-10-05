require 'spec_helper'

describe Therapist do
  it "should have residents" do
    therapist = PhysicalTherapist.create(:name => "baloi")
    r1 = Resident.create(:name => "Barka, Tanya")
    r2 = Resident.create(:name => "Puwa, Lega") 

    therapist.residents << r1
    therapist.residents << r2
    assert_equal true, therapist.save
  end

end
