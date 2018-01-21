require 'rails_helper'

RSpec.feature "viewing posts", type: :feature do
  before do
    sign_up(email: "ellie@example.com", username: "ewintram", password: "password123", password_confirmation: "password123")
  end
  scenario "User can click on a post's photo to view the post" do
    create_post(caption: "")
    visit "/"

    find(:xpath, "//a[contains(@href,'posts/11')]").click
    expect(current_path).to eq('/posts/11')
  end
end
