require 'rails_helper'

RSpec.feature "viewing posts", type: :feature do
  scenario "User can click on a post's photo to view the post" do
    post = create(:post)
    # p post
    visit "/"

    find(:xpath, "//a[contains(@href,'posts/9')]").click
    expect(current_path).to eq(post_path(post))
  end
end
