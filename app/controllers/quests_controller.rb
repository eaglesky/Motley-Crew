class QuestsController < ApplicationController
  before_action :require_login
  helper_method :sort_column, :sort_direction

  

  # GET /quests
  # GET /quests.json
  def index
    # query = params[:q]
    # query ||= {}

    # @search = Quest.search(query.merge({ quester_id_null: 1, quest_giver_id_not_eq: current_user.id, completed_eq: false}))
    
    # @quests = @search.result.paginate(:page => params[:page], :per_page => 10)
    
    # @search = Quest.search(params[:q])
    # @search.build_condition if @search.conditions.empty?

    if params.has_key?(:session)
      
        if sort_column != 'quest_giver_id'
          @quests = Quest.search(params[:session], current_user).order(sort_column + " " + sort_direction)
    .paginate(:page => params[:page], :per_page => 10)
        else
          @quests = Quest.search(params[:session], current_user).joins("JOIN users ON users.id = quests.quest_giver_id").order("users.name " + sort_direction)
    .paginate(:page => params[:page], :per_page => 10)
        end

    else

      if sort_column != 'quest_giver_id'
        @quests = Quest.simple_search(params[:search], current_user).order(sort_column + " " + sort_direction)
    .paginate(:page => params[:page], :per_page => 10)
      else
        @quests = Quest.simple_search(params[:search], current_user).joins("JOIN users ON users.id = quests.quest_giver_id").order("users.name " + sort_direction)
    .paginate(:page => params[:page], :per_page => 10)

      end
    end

  end

  def update
    @quest = Quest.find(params[:id])

    redirect_to quest_path(@quest) unless !@quest.completed

    fields = update_quest_params
    if fields[:quester_id] && (Integer(fields[:quester_id]) == current_user.id)
      @quest.quester = current_user
    end

    if fields[:completed]
      @quest.completed = true
    end

    @quest.save

    redirect_to quest_path(@quest)
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
    @quest = Quest.find(params[:id])
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(new_quest_params)
    @quest.quest_giver = current_user
    if @quest.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def new_search

  end

  private
  def new_quest_params
    params.require(:quest).permit(:title, :description, :source, :destination, :reward)
  end

  def update_quest_params
    params.require(:quest).permit(:quester_id, :completed)
  end


  
  def sort_column
    Quest.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
 
end
