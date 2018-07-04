class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy, :order_to_next_state]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  def overdue_orders
    render json: Order.where.not(status: "completed").where("due_date <= ?", Date.today-7)
  end  


  def order_to_next_state
    case @order.status
    when "draft"
      @order.update(:status => 2)
      render json: {"result" => "Order has been moved from Draft to Ready"}
    when "ready"
      @order.update(:status => 3)
      render json: {"result" => "Order has been moved from Ready to InProgress"}
    when "in_progress"
      @order.update(:status => 4)
      render json: {"result" => "Order has been moved from InProgress to Completed"}  
    when "completed"
      render json: {"result" => "Order has already been completed"}  
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:amount_cents,:amount_currency, :description, :due_date, :status)
    end
    
end
