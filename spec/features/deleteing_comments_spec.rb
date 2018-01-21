require 'rails_helper'

RSpec.feature "deleting comments", type: :feature do
  before do
    post = create(:post)
    visit "/"
    # p post
  end

  scenario "User can delete a comment" do
    find(:xpath, "//a[contains(@href,'posts/3')]").click
    create_comment(comment: "To be deleted")

    expect { delete_comment }.to change{ Comment.count }.by -1
    expect(page).to have_content("Comment deleted")
    expect(page).to_not have_content("To be deleted")
  end
end
