class DeliveryQuest < ActiveRecord::Base
  belongs_to :quest_giver, :class_name => "User"   
  belongs_to :quester, :class_name => "User"

  
  def self.simple_search(search)

    if search != nil && !search.empty?
      where('title LIKE ?', "%#{search}%")

    else
      self.all.all
    
    end
  end


end
