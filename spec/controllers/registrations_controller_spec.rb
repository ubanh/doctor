require 'rails_helper'
RSpec.describe Devise::RegistrationsController, type: :controller do
  describe 'sign up:' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it 'renders the page' do
      get :new
      expect(response).to render_template :new
    end

    it 'creates the user' do
      user_params=attributes_for(:user)
      post :create, params: { user: user_params }
      expect(User.first.email).to eq(user_params[:email])
    end

  end

  describe 'edit' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user=create(:user)
      sign_in_user(@user)
    end

    it 'renders the page' do
      get :edit
      expect(response).to render_template 'edit'
    end

    it 'edits fields' do
      user_params=attributes_for(:user)
      user_params[:current_password]='password'
      patch :update, params: { user: user_params, id: @user.id }
      expect(User.first.email).to eq(user_params[:email])
    end
  end
end