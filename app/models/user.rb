class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets
  validates :name, presence: true, uniqueness: true
end
