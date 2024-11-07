require "test_helper"

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/applications.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Applications.count, data.length
  end

  test "show" do
    get "/applications/#{Application.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "apprentice_id", "apprenticeship_id", "status", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Application.count", 1 do
      post "/applications.json", params: { apprentice_id: 6, apprenticeship_id: 6, status: "Application Pending" }
      assert_response 200
    end
  end
end
