class JourneysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_journey, only: [:show, :edit, :update, :destroy]
  before_action :check_balance,only: [:new,:create]

  # GET /journeys
  # GET /journeys.json
  def index
    @journeys = current_user.journeys.all
  end

  # GET /journeys/1
  # GET /journeys/1.json
  def show
  end

  # GET /journeys/new
  def new
    @journey = current_user.journeys.new
  end

  # GET /journeys/1/edit
  def edit
  end

  # POST /journeys
  # POST /journeys.json
  def create
    @journey = Journey.new(journey_params)
    respond_to do |format|
      if @journey.save
        format.html { redirect_to journeys_path, notice: 'Journey was successfully created.' }
        format.json { render :show, status: :created, location: @journey }
      else
        format.html { render :new }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journeys/1
  # PATCH/PUT /journeys/1.json
  def update
    respond_to do |format|
      if @journey.update(journey_params)
        @journey.complete! if @journey.is_completed
        format.html { redirect_to journeys_path, notice: 'Journey was successfully completed.' }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journeys/1
  # DELETE /journeys/1.json
  def destroy
    @journey.destroy
    respond_to do |format|
      format.html { redirect_to journeys_url, notice: 'Journey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journey
      @journey = Journey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journey_params
      params.require(:journey).permit(:origin, :destination,:via,:is_completed,:user_id)
    end

    def check_balance
      card = current_user.card
      return true if card and card.balance >= Fare::BASE_TUBE_FARE
      redirect_to cards_path, alert: "Please add card or recharge your your card!"
    end
end
