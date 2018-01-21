require 'rails_helper'

RSpec.feature "deleting posts", type: :feature do
  before(:each) do
    sign_up(email: "ellie@example.com", username: "ewintram", password: "password123", password_confirmation: "password123")
    create_post(caption: "To be removed")
    visit "/"
  end

  scenario "User can delete a post" do
    find(:xpath, "//a[contains(@href,'posts/5')]").click

    expect { delete_post }.to change{ Post.count }.by -1
    expect(page).to have_content("Post deleted")
    expect(page).to_not have_content("To be removed")
  end

  scenario "Comments associated with a post are also deleted with post" do
    find(:xpath, "//a[contains(@href,'posts/6')]").click
    create_comment(comment: "Comment to be deleted")

    expect { delete_post }.to change{ Comment.count }.by -1
    expect(page).to have_content("Post deleted")
  end

  scenario "User can only delete their own posts" do
    click_on "sign out"
    sign_up(email: "david@example.com", username: "dwright", password: "password123", password_confirmation: "password123")
    visit "/"
    find(:xpath, "//a[contains(@href,'posts/7')]").click

    expect(page).not_to have_content "delete"
  end
end
