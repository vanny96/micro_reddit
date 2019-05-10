class User < ApplicationRecord
  #before save
  before_save {email.downcase!}

  #validitations
  validates :name, presence: true, length: {minimum: 3, maximum: 16}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }

  #associations
  has_many :posts
  has_many :comments
end
