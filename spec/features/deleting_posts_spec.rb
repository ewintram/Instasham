require 'rails_helper'

RSpec.feature "deleting posts", type: :feature do
  before do
    post = create(:post, caption: "To be deleted")
    visit "/"
  end

  scenario "User can delete a post" do
    find(:xpath, "//a[contains(@href,'posts/2')]").click

    expect { delete_post }.to change{ Post.count }.by -1
    expect(page).to have_content("Post deleted")
    expect(page).to_not have_content("To be deleted")
  end
end
