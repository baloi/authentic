class Therapist < ActiveRecord::Base
  #has_many :residents
  has_many :treatments

  #def active_residents
  #  ar = residents.select{|x| x.active == true}
  #  ar
  #end

end
