require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url, as: :json
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { amount: @order.amount, description: @order.description, due_date: @order.due_date, status: @order.status } }, as: :json
    end

    assert_response 201
  end

  test "should show order" do
    get order_url(@order), as: :json
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { amount: @order.amount, description: @order.description, due_date: @order.due_date, status: @order.status } }, as: :json
    assert_response 200
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order), as: :json
    end

    assert_response 204
  end

  test "should overdue_orders order" do 
    get overdue_orders_url, as: :json
    assert_response 200
  end  

  test "should order_to_next_state order" do
    patch order_url(@order), params: { order: { status: @order.status}}, as: :json
    assert_response 200
  end

end
