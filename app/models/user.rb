class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :username, :presence => {:message => "must be present"}, :uniqueness => {:message => "must be unique"}

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
