class GuestsController < ApplicationController
  before_action :require_login
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @name = params[:receptionist_name]
    if current_user.is_admin
      @guests = Guest.all
    elsif current_user.email_id
      @guests = Receptionist.find_by_email_id(current_user.email_id).guests
    end
  end


  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    if current_receptionist
      @guest = current_receptionist.guests.new(guest_params)

      if @guest.in_time <= @guest.out_time
        respond_to do |format|
          if @guest.save
           format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
            format.json { render :show, status: :created, location: @guest }
          else
           format.html { render :new }
           format.json { render json: @guest.errors, status: :unprocessable_entity }
          end
          end
      else
        flash[:error] = 'Out-time should be greater than In-time'
      end
    end
  end


  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_guest
    @guest = Guest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def guest_params
    params.require(:guest).permit(:name, :email_id, :mobile_no, :in_time, :out_time, :receptionist_id, :is_admin)
  end
end

