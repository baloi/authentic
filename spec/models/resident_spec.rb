require 'spec_helper'

describe Resident do
  it "should have both a last name and a first name" do

    res = Resident.new
    res.should_not be_valid

    res.name = "Lopey, Fopey"
    res.should be_valid

    res.last_name.should == 'Lopey'
    res.first_name.should == 'Fopey'
  end

  it "should have treatment time per day" do
    r1 = Resident.new
    r1.name = "Barete, Grace"
    r1.pt_minutes_per_day = 60
    r1.ot_minutes_per_day = 60
    r1.save.should == true
  end

  it "should have number of treatments per week" do
    r1 = Resident.new
    r1.name = "Barete, Grace"
    r1.pt_days_per_week = 5 
    r1.ot_days_per_week = 5 

    r1.save.should == true
  end

  it "should have a room" do
    r1 = Resident.new
    r1.name = "Barete, Grace"
    r1.room = "501B" 
    r1.save.should == true

  end

  it "should have a unique name" do

    res = Resident.new
    res.should_not be_valid

    res.name = "Lopey, Fopey"
    res.save.should == true
    res.should be_valid

    res2 = Resident.new

    res2.name = "Lopey, Fopey"
    res2.should_not be_valid
    res2.save.should == false

    res3 = Resident.new

    res3.name = "Gali, Cani"
    res3.should be_valid
    res3.save.should == true

  end

end
