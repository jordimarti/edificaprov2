class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  include CourseDetails

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @course = Course.find(params[:id])
    @course_name = course_title(@course.id, params[:locale])
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    promotion = Promotion.where(:code => purchase_params[:promotion_code]).last
    @course_name = course_title(@purchase.course_id, params[:locale])
    if promotion.blank?
      course = Course.find(purchase_params[:course_id])
      @purchase.price = course.price
      using_free_promotion = false
    else
      #If the promotion is for single use and it is used it doesn't change the price
      if promotion.single_use == true && promotion.used == true
        course = Course.find(purchase_params[:course_id])
        @purchase.price = course.price
        using_free_promotion = false
      else
        if promotion.price == 0
          using_free_promotion = true
        else
          using_free_promotion = false
        end
        @purchase.price = promotion.price
        promotion.used = true
        promotion.save
      end
    end
    @purchase.user_id = current_user.id
    #Check last purchase to assign a bill number to the current purchase
    last_purchase = Purchase.last
    #If the user doesn't pay to buy the course no bill is needed
    if using_free_promotion == false
      last_bill = last_purchase.bill_number.to_i
      if last_bill == 0
        @purchase.bill_number = 1
      else
        @purchase.bill_number = last_purchase.bill_number.to_i + 1
      end
    end
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to charges_creditcard_path(purchase_id: @purchase.id), notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        @course = Course.find(@purchase.course_id)
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:user_id, :course_id, :terms_of_service, :paid, :refund, :price, :promotion_code, :bill_number)
    end
end
