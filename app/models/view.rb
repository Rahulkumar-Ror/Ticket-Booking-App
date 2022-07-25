class View < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

  has_many :workshops, dependent: :destroy
  has_many :comments, dependent: :destroy
  def self.from_omniauth(access_token)
    data = access_token.info
    # binding.pry
    view = View.where(email: data['email']).first
    unless view
      view = View.create(
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    view
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    view = View.where(:email => data["email"]).first

    unless view
      view = View.create(
            name: data["name"],
            email: data["email"],
            encrypted_password: Devise.friendly_token[0,20]
      )
    end
    view
  end
end
