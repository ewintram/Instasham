require 'rails_helper'

RSpec.feature "creating comments", type: :feature do

  scenario "User can add a comment to a post and view it" do
    post = create(:post)

    expect{ create_comment(comment: "Nice pic") }.to change{ Comment.count }.by 1
    expect(current_path).to eq(post_path(post))
    expect(page).to have_content("Nice pic")
  end
end
