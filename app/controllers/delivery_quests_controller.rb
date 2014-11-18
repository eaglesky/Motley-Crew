class DeliveryQuestsController < ApplicationController
 # before_action :set_delivery_quest, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /delivery_quests
  # GET /delivery_quests.json
  def index
    @search = DeliveryQuest.search(params[:q])
    
    @delivery_quests = @search.result.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /delivery_quests/1
  # GET /delivery_quests/1.json
  def show
    @delivery_quest = DeliveryQuest.find(params[:id])
  end

  # GET /delivery_quests/new
  def new
    @delivery_quest = DeliveryQuest.new
  end

  def create
    @delivery_quest = DeliveryQuest.new(quest_params)
    @delivery_quest.quest_giver = current_user
    if @delivery_quest.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  private
  def quest_params
    params.require(:delivery_quest).permit(:title, :description, :source, :destination, :reward)
  end
 
end
