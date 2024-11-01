require "application_system_test_case"

class ApprenticeshipsTest < ApplicationSystemTestCase
  setup do
    @apprenticeship = apprenticeships(:one)
  end

  test "visiting the index" do
    visit apprenticeships_url
    assert_selector "h1", text: "Apprenticeships"
  end

  test "should create apprenticeship" do
    visit apprenticeships_url
    click_on "New apprenticeship"

    fill_in "Compensation", with: @apprenticeship.compensation
    fill_in "Duration", with: @apprenticeship.duration
    fill_in "Employer", with: @apprenticeship.employer_id
    fill_in "Holland code preference", with: @apprenticeship.holland_code_preference
    fill_in "Location status", with: @apprenticeship.location_status
    fill_in "National recognition", with: @apprenticeship.national_recognition
    fill_in "Positions available", with: @apprenticeship.positions_available
    fill_in "Qualifications", with: @apprenticeship.qualifications
    fill_in "Skills required", with: @apprenticeship.skills_required
    fill_in "Summary", with: @apprenticeship.summary
    fill_in "Title", with: @apprenticeship.title
    click_on "Create Apprenticeship"

    assert_text "Apprenticeship was successfully created"
    click_on "Back"
  end

  test "should update Apprenticeship" do
    visit apprenticeship_url(@apprenticeship)
    click_on "Edit this apprenticeship", match: :first

    fill_in "Compensation", with: @apprenticeship.compensation
    fill_in "Duration", with: @apprenticeship.duration
    fill_in "Employer", with: @apprenticeship.employer_id
    fill_in "Holland code preference", with: @apprenticeship.holland_code_preference
    fill_in "Location status", with: @apprenticeship.location_status
    fill_in "National recognition", with: @apprenticeship.national_recognition
    fill_in "Positions available", with: @apprenticeship.positions_available
    fill_in "Qualifications", with: @apprenticeship.qualifications
    fill_in "Skills required", with: @apprenticeship.skills_required
    fill_in "Summary", with: @apprenticeship.summary
    fill_in "Title", with: @apprenticeship.title
    click_on "Update Apprenticeship"

    assert_text "Apprenticeship was successfully updated"
    click_on "Back"
  end

  test "should destroy Apprenticeship" do
    visit apprenticeship_url(@apprenticeship)
    click_on "Destroy this apprenticeship", match: :first

    assert_text "Apprenticeship was successfully destroyed"
  end
end
