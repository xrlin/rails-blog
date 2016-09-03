class Admin
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::SecurePassword

  attr_accessor :email, :password_digest

  EMAIL_VALIDATE_RE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: EMAIL_VALIDATE_RE }

  has_secure_password

  def self.find(email)
    SiteConfig.admin_email == eamil ? Admin.new(email: SiteConfig.admin_email, password_digest: SiteConfig.password_digest) : nil
  end

  def save
    if self.valid?
      SiteConfig.admin_email = self.email.downcase
      SiteConfig.password_digest = self.password_digest
      return true
    end
    false
  end

end
