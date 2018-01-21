require 'rails_helper'

RSpec.feature "creating comments", type: :feature do

  before(:each) do
    sign_up(email: "ellie@example.com", username: "ewintram", password: "password123", password_confirmation: "password123")
    create_post(caption: "It'd be rude not to")
  end

  scenario "User can add a comment to a post and view it" do
    expect{ create_comment(comment: "Nice pic") }.to change{ Comment.count }.by 1
    expect(current_path).to eq('/posts/1')
    expect(page).to have_content("Nice pic")
  end
end
