class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence:true, length: {maximum: 50}

  has_many :scolarites
  has_many :mbtis

  after_create :send_admin_mail
  def send_admin_mail
    UserNotifierMailer.send_signup_email(self).deliver
  end

end
