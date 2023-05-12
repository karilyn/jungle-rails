class User < ApplicationRecord

  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates_format_of :email, with: EMAIL_REGEX

  validates :email, presence: true, uniqueness: true

end
