require "test_helper"

class ApprenticeshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apprenticeship = apprenticeships(:one)
  end

  test "should get index" do
    get apprenticeships_url
    assert_response :success
  end

  test "should get new" do
    get new_apprenticeship_url
    assert_response :success
  end

  test "should create apprenticeship" do
    assert_difference("Apprenticeship.count") do
      post apprenticeships_url, params: { apprenticeship: { compensation: @apprenticeship.compensation, duration: @apprenticeship.duration, employer_id: @apprenticeship.employer_id, holland_code_preference: @apprenticeship.holland_code_preference, location_status: @apprenticeship.location_status, national_recognition: @apprenticeship.national_recognition, positions_available: @apprenticeship.positions_available, qualifications: @apprenticeship.qualifications, skills_required: @apprenticeship.skills_required, summary: @apprenticeship.summary, title: @apprenticeship.title } }
    end

    assert_redirected_to apprenticeship_url(Apprenticeship.last)
  end

  test "should show apprenticeship" do
    get apprenticeship_url(@apprenticeship)
    assert_response :success
  end

  test "should get edit" do
    get edit_apprenticeship_url(@apprenticeship)
    assert_response :success
  end

  test "should update apprenticeship" do
    patch apprenticeship_url(@apprenticeship), params: { apprenticeship: { compensation: @apprenticeship.compensation, duration: @apprenticeship.duration, employer_id: @apprenticeship.employer_id, holland_code_preference: @apprenticeship.holland_code_preference, location_status: @apprenticeship.location_status, national_recognition: @apprenticeship.national_recognition, positions_available: @apprenticeship.positions_available, qualifications: @apprenticeship.qualifications, skills_required: @apprenticeship.skills_required, summary: @apprenticeship.summary, title: @apprenticeship.title } }
    assert_redirected_to apprenticeship_url(@apprenticeship)
  end

  test "should destroy apprenticeship" do
    assert_difference("Apprenticeship.count", -1) do
      delete apprenticeship_url(@apprenticeship)
    end

    assert_redirected_to apprenticeships_url
  end
end
