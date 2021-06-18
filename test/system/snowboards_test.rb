require "application_system_test_case"

class SnowboardsTest < ApplicationSystemTestCase
  setup do
    @snowboard = snowboards(:one)
  end

  test "visiting the index" do
    visit snowboards_url
    assert_selector "h1", text: "Snowboards"
  end

  test "creating a Snowboard" do
    visit snowboards_url
    click_on "New Snowboard"

    fill_in "Color", with: @snowboard.color
    fill_in "Description", with: @snowboard.description
    fill_in "Name", with: @snowboard.name
    fill_in "Price", with: @snowboard.price
    click_on "Create Snowboard"

    assert_text "Snowboard was successfully created"
    click_on "Back"
  end

  test "updating a Snowboard" do
    visit snowboards_url
    click_on "Edit", match: :first

    fill_in "Color", with: @snowboard.color
    fill_in "Description", with: @snowboard.description
    fill_in "Name", with: @snowboard.name
    fill_in "Price", with: @snowboard.price
    click_on "Update Snowboard"

    assert_text "Snowboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Snowboard" do
    visit snowboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Snowboard was successfully destroyed"
  end
end
