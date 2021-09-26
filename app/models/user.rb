class User < ApplicationRecord
  devise :two_factor_authenticatable, :two_factor_backupable,
         otp_secret_encryption_key: ENV['OTP_KEY']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services

  def otp_qr_code
    issuer = 'Endless'
    # label = "#{issuer}:#{email}"
    qrcode = RQRCode::QRCode.new(otp_provisioning_uri(email, issuer: issuer))
    qrcode.as_svg(module_size: 4)
  end

end
