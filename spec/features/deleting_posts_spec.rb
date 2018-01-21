require 'rails_helper'

RSpec.feature "deleting posts", type: :feature do
  before(:each) do
    post = create(:post, caption: "To be deleted")
    visit "/"
    # p post
  end

  scenario "User can delete a post" do
    find(:xpath, "//a[contains(@href,'posts/4')]").click

    expect { delete_post }.to change{ Post.count }.by -1
    expect(page).to have_content("Post deleted")
    expect(page).to_not have_content("To be deleted")
  end

  scenario "Comments associated with a post are also deleted with post" do
    find(:xpath, "//a[contains(@href,'posts/5')]").click
    create_comment(comment: "Comment to be deleted")

    expect { delete_post }.to change{ Comment.count }.by -1
    expect(page).to have_content("Post deleted")
  end
end
