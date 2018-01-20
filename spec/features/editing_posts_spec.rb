require 'rails_helper'

RSpec.feature "editing posts", type: :feature do
  before(:each) do
    post = create(:post)

    visit "/"
    find(:xpath, "//a[contains(@href,'posts/2')]").click
    click_on "edit"
  end
  scenario "User can edit a post" do
    fill_in "post[caption]", with: "Edited caption"
    click_on "Update Post"

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Edited caption")
    expect(page).not_to have_content("Chihuahua... or blueberry muffin?")
  end
end
