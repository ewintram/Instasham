require 'rails_helper'

RSpec.feature "user can sign in and out", type: :feature do
  before(:each) do
    sign_up(email: "ellie@example.com", username: "ewintram", password: "password123", password_confirmation: "password123")
    click_on "sign out"
  end

  scenario "signed-out user can sign in" do
    sign_in(username: "ewintram", password: "password123")

    within "nav" do
      expect(page).to have_content "Welcome ewintram"
      expect(page).to have_content "sign out"
      expect(page).not_to have_content "sign in"
    end
  end
end
