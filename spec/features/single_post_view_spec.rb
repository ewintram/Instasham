require 'rails_helper'

RSpec.feature "Single post view", type: :feature do
  scenario "User can click on a post's photo to view the post" do
    post = create(:post)
    visit "/"
    
    find(:xpath, "//a[contains(@href,'posts/7')]").click
    expect(current_path).to eq(post_path(post))
  end
end
