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
    @delivery_quests = DeliveryQuest.search(params[:search], params[:page])
  end
  
end
