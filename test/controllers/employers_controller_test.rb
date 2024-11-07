require "test_helper"

class EmployersControllerTest < ActionDispatch::IntegrationTest
  
  test "create" do
    assert_difference "User.count", 1 do
      post "/employers.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      assert_response 201
    end
  end

  setup do
    @employer = employers(:one)
  end

  # Test index action for employers
  test "should get index" do
    get employers_url
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Employer.count, data.length
  end

  # Test new action for employers
  test "should get new" do
    get new_employer_url
    assert_response :success
  end

  # Test create action for employers
  test "should create employer" do
    assert_difference("Employer.count", 1) do
      post employers_url, params: { employer: { email: "newemployer@example.com", password: "password123", company_name: "New Company", company_logo: "logo_url", description: "A new company description", industry: "Tech", website: "http://newcompany.com" } }
    end

    assert_redirected_to employer_url(Employer.last)
    follow_redirect!
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal "newemployer@example.com", data["email"]
    assert_equal "New Company", data["company_name"]
  end

  # Test show action for an employer
  test "show" do
    get "/employers/#{Employer.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "emam", "password_digest", "company_name", "company_logo", "description", "industry", "website", "created_at", "updated_at"], data.keys
  end

  # Test edit action for an employer
  test "should get edit" do
    get edit_employer_url(@employer)
    assert_response :success
  end

  # Test update action for an employer
  test "update" do
    employer = Employer.first
    patch "/employer/#{employer.id}.json", params: { email: "Updated email" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated email", data["email"]
  end

  # Test destroy action for an employer
  test "destroy" do
    assert_difference "Employer.count", -1 do
      delete "/employers/#{Employer.first.id}.json"
      assert_response 200
    end
  end
end


create_table "employers", force: :cascade do |t|
  t.string "email"
  t.string "password_digest"
  t.string "company_name"
  t.string "company_logo"
  t.string "description"
  t.string "industry"
  t.string "website"