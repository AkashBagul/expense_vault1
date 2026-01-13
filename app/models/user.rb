class User < ApplicationRecord
  has_secure_password
  has_many :categories, dependent: :destroy

  # Validations
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 555 }, uniqueness: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " field only letters allowed" }
  validates :mobile_number, allow_nil: true, format: { with: /\A\d{10,12}\z/, message: "must be 10 to 12 digits" }

  # callbacks
  after_create :create_default_categories


  private
    def create_default_categories
      default_categories = [ "Food", "Transport", "Entertainment", "Utilities", "Healthcare", "Education", "Shopping", "Travel", "Miscellaneous" ]

      default_categories.each do |category_name|
        self.categories.create(name: category_name)
      end
    end
end
