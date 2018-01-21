require 'rails_helper'

RSpec.feature "deleting comments", type: :feature do
  before(:each) do
    sign_up(email: "ellie@example.com", username: "ewintram", password: "password123", password_confirmation: "password123")
    create_post(caption: "Why not")
    create_comment(comment: "To be deleted")
  end

  scenario "User can delete a comment" do
    expect { delete_comment }.to change{ Comment.count }.by -1
    expect(page).to have_content("Comment deleted")
    expect(page).to_not have_content("To be deleted")
  end

  scenario "User can only delete their own comments" do
    click_on "sign out"
    sign_up(email: "david@example.com", username: "dwright", password: "password123", password_confirmation: "password123")
    visit "/"
    find(:xpath, "//a[contains(@href,'posts/4')]").click

    expect(page).not_to have_content "delete comment"
  end
end
