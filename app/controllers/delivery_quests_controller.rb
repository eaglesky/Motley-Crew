class DeliveryQuestsController < ApplicationController
  before_action :require_login
  helper_method :sort_column, :sort_direction
  # GET /delivery_quests
  # GET /delivery_quests.json
  def index
    # query = params[:q]
    # query ||= {}

    # @search = DeliveryQuest.search(query.merge({ quester_id_null: 1, quest_giver_id_not_eq: current_user.id, completed_eq: false}))
    
    # @delivery_quests = @search.result.paginate(:page => params[:page], :per_page => 10)
    
    # @search = DeliveryQuest.search(params[:q])
    # @search.build_condition if @search.conditions.empty?
    @delivery_quests = DeliveryQuest.simple_search(params[:search]).order(sort_column + " " + sort_direction)
    .paginate(:page => params[:page], :per_page => 10)
  end

  def update
    @delivery_quest = DeliveryQuest.find(params[:id])

    redirect_to delivery_quest_path(@delivery_quest) unless !@delivery_quest.completed

    fields = update_quest_params
    if fields[:quester_id] && (Integer(fields[:quester_id]) == current_user.id)
      @delivery_quest.quester = current_user
    end

    if fields[:completed]
      @delivery_quest.completed = true
    end

    @delivery_quest.save

    redirect_to delivery_quest_path(@delivery_quest)
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
    @delivery_quest = DeliveryQuest.new(new_quest_params)
    @delivery_quest.quest_giver = current_user
    if @delivery_quest.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  private
  def new_quest_params
    params.require(:delivery_quest).permit(:title, :description, :source, :destination, :reward)
  end

  def update_quest_params
    params.require(:delivery_quest).permit(:quester_id, :completed)
  end


  
  def sort_column
    DeliveryQuest.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
 
end
