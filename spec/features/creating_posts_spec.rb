require 'rails_helper'

RSpec.feature "Creating a post", type: :feature do

  # before(:each) do
  #   sign_up()
  # end

  scenario "User can make a post to instagram" do
    visit "/"
    click_on "new post"
    attach_file("post[image]", "spec/files/images/avo-toast.jpg")
    fill_in "post[caption]", with: "My first post #avotoast"
    click_on "Create Post"
    expect(page).to have_content "#avotoast"
    expect(page).to have_css "img[src*='avo-toast.jpg']"
  end
end
