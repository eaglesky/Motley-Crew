class DeliveryQuest < ActiveRecord::Base
  belongs_to :quest_giver, :class_name => "User"   
  belongs_to :quester, :class_name => "User"

  

  def self.simple_search(search, current_user_obj)

    quests = DeliveryQuest.where.not(completed: true)
    quests = quests.where(quester_id: nil)
    


  #  quests = quests.where.not(quest_giver_id: current_user_obj.id)
    quests = quests.where('(quest_giver_id IS ?) OR (quest_giver_id != ?)', nil, current_user_obj.id)
    
    
    quests_system = quests.where('title LIKE ?', "%system%")
   # debugger

    if search != nil && !search.empty?
      quests.where('title LIKE ?', "%#{search}%")

    else
      quests

    
    end
  end

  def self.search(search_options, current_user_obj)

    quests = DeliveryQuest.where.not(completed: true)
    quests = quests.where.not(quest_giver_id: current_user_obj.id)
    quests = quests.where(quester_id: nil)

    quests = quests.where('title LIKE ?', "%#{search_options[:title]}%") if search_options[:title].present?
    quests = quests.where('source LIKE ?', "%#{search_options[:source]}%") if search_options[:source].present?
    quests = quests.where('destination LIKE ?', "%#{search_options[:destination]}%") if search_options[:destination].present?

    quests

  end

end
