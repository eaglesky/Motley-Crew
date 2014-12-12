class User < ActiveRecord::Base

 # attr_accessor :name, :email
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: {case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  has_many :posted_quests, :class_name => "Quest", :foreign_key => "quest_giver_id"
  has_many :quest_roles

  # def initialize(attributes = {})
  #   @name  = attributes[:name]
  #   @email = attributes[:email]
  # end

  # def formatted_email
  #   "#{@name} <#{@email}>"
  # end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
