class Patient < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, presence: true
  validates :phone_number, presence: true, length: {minimum: 10}

  def full_name
    first_name + " " + last_name
  end
end
