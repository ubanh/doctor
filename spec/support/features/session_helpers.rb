module SessionHelper

  def sign_in_user (user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  def login_user(email, password)
    visit new_user_session_path
    fill_in :id => 'user_email', with: email
    fill_in :id => 'user_password', with: password
    click_button "Log in"
  end
end
