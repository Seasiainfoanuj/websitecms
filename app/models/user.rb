class User < ActiveRecord::Base
  # Include devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :validatable,
         :recoverable, :rememberable, :trackable
         # :registerable, :confirmable, :lockable, :timeoutable

  mount_uploader :avatar, AvatarUploader

  ROLES = %i[admin subscriber]

  def admin?
    role == "admin" ? true : false
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.search(search)
    if search
      where('first_name like :search or last_name like :search or email like :search', search: "%#{search}%")
    else
      scoped
    end
  end
end
