require 'bcrypt'
class User < ApplicationRecord
  # has_secure_password
  include BCrypt
  validates :email, :user_name, :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(password_hash)
    @password = Password.create(password_hash)
    self.password_hash = @password
  end
end


# function a(){
#   return new Promise((resolve, reject) => {
#   setTimeout(() => {
#     resolve('Print a');
#   }, 1000);
# });
# }
# const a = async () => {
#   const b = await Promise.all();
# }