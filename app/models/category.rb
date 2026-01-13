class Category < ApplicationRecord
  belongs_to :user

  # validations
  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }, length: { maximum: 50 }
end
