require 'rails_helper'

RSpec.feature "Displaying all posts on index page", type: :feature do

  scenario "User can see all posts and comments on index page" do
    post_one = create(:post, caption: "Is it a chihuahua?")
    post_two = create(:post, caption: "Or is it a blueberry muffin?")

    visit "/"
    expect(page).to have_content("Is it a chihuahua?")
    expect(page).to have_content("Or is it a blueberry muffin?")
    expect(page).to have_css("img[src*='chihuahua-or-muffin.jpg']")
  end
end
