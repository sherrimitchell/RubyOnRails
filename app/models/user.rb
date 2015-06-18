class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password, :access_token, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: EMAIL_REGEX,
                              message: "is not a valid email." }
  validates :user_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_validation :ensure_access_token

  def ensure_access_token
    if self.access_token.blank?
      self.access_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end

  has_many :posts
  has_many :guesses
end
