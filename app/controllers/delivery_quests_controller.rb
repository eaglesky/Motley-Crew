class DeliveryQuestsController < ApplicationController
 # before_action :set_delivery_quest, only: [:show, :edit, :update, :destroy]

  # GET /delivery_quests
  # GET /delivery_quests.json
  def index
    @search = DeliveryQuest.search(params[:q])
    
    #@delivery_quests = DeliveryQuest.search(params[:search], params[:page])
    @delivery_quests = @search.result.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /delivery_quests/1
  # GET /delivery_quests/1.json
  def show

  end

  # GET /delivery_quests/new
  def new
    @delivery_quest = DeliveryQuest.new
  end

  

 
end
