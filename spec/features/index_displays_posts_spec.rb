require 'rails_helper'

RSpec.feature "Displaying all posts on index page", type: :feature do
  before do
    sign_up(email: "ellie@example.com", username: "ewintram", password: "password123", password_confirmation: "password123")
  end

  scenario "User can see all posts and comments on index page" do
    create_post(caption: "Is it a chihuahua?")
    create_post(caption: "Or is it a blueberry muffin?")

    visit "/"
    expect(page).to have_content("Is it a chihuahua?")
    expect(page).to have_content("Or is it a blueberry muffin?")
    expect(page).to have_css("img[src*='avo-toast.jpg']")
  end
end
