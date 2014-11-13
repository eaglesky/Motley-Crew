class DeliveryQuestsController < ApplicationController
  before_action :set_delivery_quest, only: [:show, :edit, :update, :destroy]

  # GET /delivery_quests
  # GET /delivery_quests.json
  def index
    @delivery_quests = DeliveryQuest.all
  end

  # GET /delivery_quests/1
  # GET /delivery_quests/1.json
  def show
  end

  # GET /delivery_quests/new
  def new
    @delivery_quest = DeliveryQuest.new
  end

  # GET /delivery_quests/1/edit
  def edit
  end

  # POST /delivery_quests
  # POST /delivery_quests.json
  def create
    @delivery_quest = DeliveryQuest.new(delivery_quest_params)

    respond_to do |format|
      if @delivery_quest.save
        format.html { redirect_to @delivery_quest, notice: 'Delivery quest was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_quest }
      else
        format.html { render :new }
        format.json { render json: @delivery_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_quests/1
  # PATCH/PUT /delivery_quests/1.json
  def update
    respond_to do |format|
      if @delivery_quest.update(delivery_quest_params)
        format.html { redirect_to @delivery_quest, notice: 'Delivery quest was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_quest }
      else
        format.html { render :edit }
        format.json { render json: @delivery_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_quests/1
  # DELETE /delivery_quests/1.json
  def destroy
    @delivery_quest.destroy
    respond_to do |format|
      format.html { redirect_to delivery_quests_url, notice: 'Delivery quest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_quest
      @delivery_quest = DeliveryQuest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_quest_params
      params.require(:delivery_quest).permit(:title, :description, :reward)
    end
end
