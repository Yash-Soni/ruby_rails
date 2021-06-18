require "test_helper"

class SnowboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snowboard = snowboards(:one)
  end

  test "should get index" do
    get snowboards_url
    assert_response :success
  end

  test "should get new" do
    get new_snowboard_url
    assert_response :success
  end

  test "should create snowboard" do
    assert_difference('Snowboard.count') do
      post snowboards_url, params: { snowboard: { color: @snowboard.color, description: @snowboard.description, name: @snowboard.name, price: @snowboard.price } }
    end

    assert_redirected_to snowboard_url(Snowboard.last)
  end

  test "should show snowboard" do
    get snowboard_url(@snowboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_snowboard_url(@snowboard)
    assert_response :success
  end

  test "should update snowboard" do
    patch snowboard_url(@snowboard), params: { snowboard: { color: @snowboard.color, description: @snowboard.description, name: @snowboard.name, price: @snowboard.price } }
    assert_redirected_to snowboard_url(@snowboard)
  end

  test "should destroy snowboard" do
    assert_difference('Snowboard.count', -1) do
      delete snowboard_url(@snowboard)
    end

    assert_redirected_to snowboards_url
  end
end
