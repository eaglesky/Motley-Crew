class MainStaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def quests
    @delivery_quests = DeliveryQuest.paginate(page: params[:page], per_page: 10)
    
  end
  
end
