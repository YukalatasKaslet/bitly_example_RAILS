class User < ActiveRecord::Base
  include BCrypt
  #Relaciones
  has_many :urls
  # Remember to create a migration!
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Validaciones
  validates :name, presence: { message: " no puede ir vacío" }
  validates :password, presence: { message: "no puede ir vacío" }, on: :create
  #validates :password, length: { minimum: 3, maximum: 8 }, on: :create #No funciono
  validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}, 
                    presence: { message: "no puede ir vacío" },
                    format: { :with => VALID_EMAIL_REGEX , message: "formato inválido" }
  #validates :email, presence: true, uniqueness: true

  #se está usando en self.authenticate *user.password*
  def password
    @password ||= Password.new(password_digest)
  end

  #se usa al momento de crear o modificar la contraseña
  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end
end
