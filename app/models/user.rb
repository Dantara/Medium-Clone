class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :omniauthable,
    omniauth_providers: [:google_oauth2]
  validates :email, :first_name, :second_name, presence: true

  has_many :posts

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(email: data['email'],
           first_name: data['first_name'],
           second_name: data['first_name'],
           password: Devise.friendly_token[0,20]
        )
    end

    user
  end
end
