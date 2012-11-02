class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  scope :admins, lambda {where :role => 'Admin'}
  scope :super_admins, lambda {where :role => 'SuperAdmin'}

  def has_role?(role)
    get_role == role
  end

  def get_role
    self.role.to_sym
  end
end
