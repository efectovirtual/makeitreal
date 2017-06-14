class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :addresses
  has_many :invoices

  validates :email, :username, uniqueness: { message: 'Parce create otro %{attribute}' }
  validates :username, length: { in: 5..50 }

  before_validation :sanitize

  private
    def sanitize
      email.downcase!
      username.downcase!
    end
end
