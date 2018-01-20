require 'rails_helper'

feature "Single post view" do
  scenario "User can click on a post's photo to view the post" do
    post = create(:post)

    visit "/"
    find(:xpath, "//a[contains(@href,'posts/4')]").click
    expect(current_path).to eq(post_path(post))
  end
end
