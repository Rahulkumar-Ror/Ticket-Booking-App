require "rails_helper"
  feature "View signs in" do
    given!(:view) { FactoryBot.create(:view) }
    # binding.pry
    scenario "with valid credentials" do
    visit view_session_path
    fill_in "Email", with: view.email
    fill_in "Password", with: view.password
    check "Remember me"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
	end
end
