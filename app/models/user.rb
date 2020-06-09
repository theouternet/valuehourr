class User < ActiveRecord::Base
  has_secure_password

  validates :username, :password, presence: true


  has_many :shares 

  with_options if: :omniauth_uid_blank? do |u|
    u.validates :username, presence: true
    u.validates :username, format: {
      with: /\w{4,}/,
      message: "must contain 4+ characters; only letters, numbers, and underscores are allowed"}
    u.validate :username_taken?
  end


  def omniauth_uid_blank?
    self.omniauth_uid.blank?
  end

  def username_taken?
    errors.add(:username, "is already in use") if
      User.all.select {|u| !u.username.blank?}
      .detect {|u| u.username == self.username}
  end




end
