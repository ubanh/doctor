require 'rails_helper'
RSpec.feature 'Users', js: true do
  describe "users test" do
    let!(:user) {create(:user)}

    it 'create and log in user' do
      new_user = build(:user)
      visit new_user_registration_path
      expect(page).to have_content("Sign up")
      fill_in id: "user_email", with: new_user.email
      fill_in id: "user_password", with: new_user.password
      fill_in id: "user_password_confirmation", with: new_user.password_confirmation
      click_button("Sign up")
      expect(page).to have_content("Welcome to the best patient management webside")
    end

    it 'update user' do
      visit edit_user_registration_path(id: user.id)
      expect(page).to have_no_content("Edit User")
      login_user(user.email, user.password)
      visit edit_user_registration_path(id: user.id)
      expect(page).to have_content("Edit User")
      update_user = build(:user)
      fill_in id: "user_email", with: update_user.email
      fill_in id: "user_password", with: update_user.password
      fill_in id: "user_password_confirmation", with: update_user.password_confirmation
      fill_in id: "user_current_password", with: user.password
      click_button("Update")
      expect(page).to have_content("Welcome to the best patient management webside")
    end

    # it 'should log out' do
    #   visit new_user_session_path
    #   expect(page).to have_content("Iniciar Sesión")
    #   login_user(user.email, user.password)
    #   expect(page).to have_css(".fa-sign-out")
    #   click_link("sign_out")
    #   expect(page).to have_content("Iniciar Sesión")
    # end

  end
end

