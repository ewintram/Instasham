require 'rails_helper'

RSpec.feature "Creating a post", type: :feature do

  # before(:each) do
  #   sign_up()
  # end

  scenario "User can make a post to instagram" do
    expect{ create_post(caption: "My first post #avotoast") }.to change{ Post.count }.by 1
    expect(page).to have_content "#avotoast"
    expect(page).to have_css "img[src*='avo-toast.jpg']"
  end

  scenario "User must include a photo in a post" do
    visit "/"
    click_on "new post"
    fill_in "post[caption]", with: "No picture because YOLO"
    click_on "Create Post"
    expect(page).to have_content "Posts must have an image"
  end
end
