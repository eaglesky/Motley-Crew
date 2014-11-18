class DeliveryQuest < ActiveRecord::Base
  belongs_to :quest_giver, :class_name => "User"   
  belongs_to :quester, :class_name => "User"

  
  def self.simple_search(search, page)

    if search != nil && !search.empty?
      order('title').where('title LIKE ?', "%#{search}%").paginate(:page => page,:per_page => 10)

    else
      order('id').paginate(page: page, per_page: 10)
    
    end
  end


end
