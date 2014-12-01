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

  def self.search(search_options)

    quests = DeliveryQuest.where('title LIKE ?', "%#{search_options[:title]}%") if search_options[:title].present?
    quests = quests.where('source LIKE ?', "%#{search_options[:source]}%") if search_options[:source].present?
    quests = quests.where('destination LIKE ?', "%#{search_options[:destination]}%") if search_options[:destination].present?

    quests

  end

end
