require "test_helper"

class ApprenticeshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apprenticeship = apprenticeships(:one)
  end

  # Test index action for apprenticeships
  test "should get index" do
    get apprenticeships_url
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Apprenticeship.count, data.length
  end

  # Test new action for apprenticeships
  test "should get new" do
    get new_apprenticeship_url
    assert_response :success
  end

  # Test create action for apprenticeships
  test "should create apprenticeship" do
    assert_difference("Apprenticeship.count", 1) do
      post apprenticeships_url, params: { apprenticeship: { compensation: "50000", duration: "6 months", employer_id: @apprenticeship.employer_id, holland_code_preference: "RIASEC", location_status: "remote", national_recognition: true, positions_available: 3, qualifications: "Some qualifications", skills_required: "Some skills", summary: "A new apprenticeship", title: "Junior Developer" } }
    end

    assert_redirected_to apprenticeship_url(Apprenticeship.last)
    follow_redirect!
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal "Junior Developer", data["title"]
    assert_equal "A new apprenticeship", data["summary"]
  end

  # Test show action for an apprenticeship
  test "should show apprenticeship" do
    get apprenticeship_url(@apprenticeship)
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal @apprenticeship.title, data["title"]
    assert_equal @apprenticeship.summary, data["summary"]
  end

  # Test edit action for an apprenticeship
  test "should get edit" do
    get edit_apprenticeship_url(@apprenticeship)
    assert_response :success
  end

  # Test update action for an apprenticeship
  test "should update apprenticeship" do
    patch apprenticeship_url(@apprenticeship), params: { apprenticeship: { title: "Updated Title", summary: "Updated Summary" } }
    assert_redirected_to apprenticeship_url(@apprenticeship)
    follow_redirect!
    assert_response :success

    @apprenticeship.reload
    assert_equal "Updated Title", @apprenticeship.title
    assert_equal "Updated Summary", @apprenticeship.summary
  end

  # Test destroy action for an apprenticeship
  test "should destroy apprenticeship" do
    assert_difference("Apprenticeship.count", -1) do
      delete apprenticeship_url(@apprenticeship)
    end

    assert_redirected_to apprenticeships_url
    follow_redirect!
    assert_response :success
  end
end
