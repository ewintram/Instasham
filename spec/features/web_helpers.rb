module Helpers

  def sign_up(email: email, username: username, password: password, password_confirmation: password_confirmation)
    visit '/users/sign_up'
    fill_in 'user[email]', with: email
    fill_in 'user[username]', with: username
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password_confirmation
    click_button "sign up"
  end

  def sign_in(username: username, password: password)
    visit "/"
    click_on "sign in"
    fill_in 'user[login]', with: username
    fill_in 'user[password]', with: password
    within "form" do
      click_on "sign in"
    end
  end

  def create_post(caption: caption)
    visit "/"
    click_on "new post"
    fill_in "post[caption]", with: caption
    attach_file("post[image]", "spec/files/images/avo-toast.jpg")
    click_on "Create Post"
  end

  def delete_post
    click_on "delete"
  end

  def create_comment(comment: comment)
    fill_in "comment[comment]", with: comment
    click_on "Create Comment"
  end

  def delete_comment
    click_on "delete comment"
  end

end
