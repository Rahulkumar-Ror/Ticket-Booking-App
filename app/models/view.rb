class View < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

  has_many :workshops, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
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


  PROFILE_FIELDS = %i[full_name contact_number ].freeze

  def profile_complete?
    profile_complete == 100
  end

  def profile_complete
    fields_complete.zero? ? 10 : percent_complete
  end

  def missing_profile_section
    PROFILE_FIELDS.select { |f| __send__(f).blank? }.first
  end

  private

    def fields_complete
      Float(PROFILE_FIELDS.count { |f| __send__(f).present? })
    end

    def percent_complete
      fields_complete / fields_total * 100.0
    end

    def fields_total
      Float(PROFILE_FIELDS.count)
    end
end
