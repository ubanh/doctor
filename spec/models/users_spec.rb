require "rails_helper"
RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'validates email presence' do
    user = build(:user, email: '')
    expect(user.save).to be_falsey
    expect(user.errors.keys).to include(:email)
  end

  it 'validates email case insensitive' do
    create(:user,
           email: 'this_mail@mail.com',
    )

    user=build(:user,
               email: 'ThIs_MaIl@mAil.CoM',
    )
    expect(user.save).to be_falsey
    expect(user.errors.keys).to include(:email)
  end

  it 'validates password presence' do
    user= build(:user, password: '')
    expect(user.save).to  be_falsey
    expect(user.errors.keys).to include(:password)
  end

  it 'validates password length' do
    user= build(:user, password: '12345', password_confirmation: '12345')
    expect(user.save).to be_falsey
    expect(user.errors.keys).to include(:password)
  end

  it 'validate password confirmation' do
    user= build(:user, password: 'password', password_confirmation: 'something')
    expect(user.save).to be_falsey
    expect(user.errors.keys).to include(:password_confirmation)
  end

end