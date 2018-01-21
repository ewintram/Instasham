require 'rails_helper'

RSpec.feature "editing posts", type: :feature do
  before(:each) do
    post = create(:post)
    visit "/"
    # p post
  end

  scenario "User can edit a post" do
    find(:xpath, "//a[contains(@href,'posts/7')]").click
    click_on "edit"
    fill_in "post[caption]", with: "Edited caption"
    click_on "Update Post"

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Edited caption")
    expect(page).not_to have_content("Chihuahua... or blueberry muffin?")
  end

  scenario "User cannot edit a post with a non-image file" do
    find(:xpath, "//a[contains(@href,'posts/8')]").click
    click_on "edit"
    attach_file("post[image]", "spec/files/images/test.xlsx")
    click_on "Update Post"

    expect(page).to have_content("Invalid file. Only image files can be uploaded")
  end
end
