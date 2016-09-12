class Admin
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::SecurePassword

  attr_accessor :email, :password_digest

  EMAIL_VALIDATE_RE = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: EMAIL_VALIDATE_RE }

  has_secure_password

  validates :password, confirmation: true, presence: true, length: 6..36

  def self.find(email)
    SiteConfig.admin_email == email ? Admin.new(email: SiteConfig.admin_email, password_digest: SiteConfig.password_digest) : nil
  end

  def self.find_by_token(token)
    payload = Token.decode token
    return nil if payload.nil?
    # Decoded token the hash key is string not symbol
    Admin.find(payload['admin_email'])
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def token
    Token.encode admin_email: self.email, exp: Time.now.to_i + 4 * 3600
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
