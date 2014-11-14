class DeliveryQuest < ActiveRecord::Base
  belongs_to :quest_giver, :class_name => "User" 
  validates :quest_giver_id, :presence => true
  belongs_to :quester, :class_name => "User"
  
 # has_one :source, :class_name => "Location", :foreign_key => "location_id"
 # has_one :destination, :class_name => "Location", :foreign_key => "location_id"

  

end
