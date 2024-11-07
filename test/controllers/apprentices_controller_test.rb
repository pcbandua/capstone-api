# require "test_helper"

# class ApprenticesControllerTest < ActionDispatch::IntegrationTest
#   test "new" do
#     get "/apprentice.json"
#     assert_response 200

#     data = JSON.parse(response.body)
#     assert_equal Apprentice.count, data.length
#   end

#   test "create" do
#     assert_difference "Application.count", 1 do
#       post "/applications.json", params: { apprentice_id: 6, apprenticeship_id: 6, status: "Application Pending" }
#       assert_response 200
#     end
#   end

#   test "destroy" do
#     assert_difference "Apprentice.count", -1 do
#       delete "/apprentices/#{Apprentice.first.id}.json"
#       assert_response 200
#     end
#   end
# end

require "test_helper"

class ApprenticesControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Apprentice.count", 1 do
      post "/apprentices.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response 201
    end
  end

  # Test index action for apprentices
  test "index" do
    get "/apprentices.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Apprentice.count, data.length
  end

  # Test show action for an apprentice
  test "show" do
    apprentice = Apprentice.first
    get "/apprentices/#{apprentice.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal apprentice.id, data["id"]
    assert_equal apprentice.name, data["name"]
  end

  # Test create action for an apprentice
  test "create" do
    assert_difference "Apprentice.count", 1 do
      post "/apprentices.json", params: { apprentice: { name: "New Apprentice", skill_level: "Beginner" } }
      assert_response :success
    end

    data = JSON.parse(response.body)
    assert_equal "New Apprentice", data["name"]
  end

  # Test create action for applications
  test "create application" do
    assert_difference "Application.count", 1 do
      post "/applications.json", params: { apprentice_id: Apprentice.first.id, apprenticeship_id: Apprenticeship.first.id, status: "Application Pending" }
      assert_response :success
    end

    data = JSON.parse(response.body)
    assert_equal Apprentice.first.id, data["apprentice_id"]
    assert_equal Apprenticeship.first.id, data["apprenticeship_id"]
    assert_equal "Application Pending", data["status"]
  end

  # Test update action for an apprentice
  test "update" do
    apprentice = Apprentice.first
    patch "/apprentices/#{apprentice.id}.json", params: { apprentice: { name: "Updated Name" } }
    assert_response :success

    apprentice.reload
    assert_equal "Updated Name", apprentice.name
  end

  # Test destroy action for an apprentice
  test "destroy" do
    assert_difference "Apprentice.count", -1 do
      delete "/apprentices/#{Apprentice.first.id}.json"
      assert_response :success
    end
  end
end
