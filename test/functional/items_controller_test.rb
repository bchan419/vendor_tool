require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { description: @item.description, fob: @item.fob, fob_port: @item.fob_port, item_no: @item.item_no, model_no: @item.model_no, moq: @item.moq, packaging: @item.packaging, payment_terms: @item.payment_terms, project_id: @item.project_id, remarks: @item.remarks, repeat_order_leadtime: @item.repeat_order_leadtime, source_from: @item.source_from, suggested_retail: @item.suggested_retail, tooling_complete: @item.tooling_complete, vendor: @item.vendor, vendor_brand: @item.vendor_brand, vendor_email: @item.vendor_email }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    put :update, id: @item, item: { description: @item.description, fob: @item.fob, fob_port: @item.fob_port, item_no: @item.item_no, model_no: @item.model_no, moq: @item.moq, packaging: @item.packaging, payment_terms: @item.payment_terms, project_id: @item.project_id, remarks: @item.remarks, repeat_order_leadtime: @item.repeat_order_leadtime, source_from: @item.source_from, suggested_retail: @item.suggested_retail, tooling_complete: @item.tooling_complete, vendor: @item.vendor, vendor_brand: @item.vendor_brand, vendor_email: @item.vendor_email }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
