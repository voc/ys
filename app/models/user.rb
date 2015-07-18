class User < ActiveRecord::Base
  has_many :productions

  acts_as_authentic do |c|
    c.validate_email_field    = false
    c.validate_password_field = false
    c.validate_login_field    = true
    c.validates_uniqueness_of_email_field_options = true
    c.session_class = UserSession
    c.login_field = :login
  end

  def admin?
    if self.admin
      true
    else
      false
    end
  end
end
