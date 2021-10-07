class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info 
    user = User.where(email: data['email']).first 
    user 
  end

  has_many :tasks
  has_many :lists, :through ⇒ :tasks
  belongs_to :team
end