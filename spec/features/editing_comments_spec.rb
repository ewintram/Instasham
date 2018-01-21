require 'rails_helper'

RSpec.feature "editing comments", type: :feature do

  before do
    sign_up(email: "ellie@example.com", username: "ewintram", password: "password123", password_confirmation: "password123")
    create_post(caption: "Y tho")
  end

  scenario "User can edit comments" do
    visit "/"
    find(:xpath, "//a[contains(@href,'posts/6')]").click

    create_comment(comment: "Nice pic")
    click_on "edit comment"
    fill_in "comment[comment]", with: "Edited comment"
    click_on "Update Comment"

    expect(page).to have_content("Comment updated")
    expect(page).to have_content("Edited comment")
    expect(page).not_to have_content("Nice pic")
  end
end
